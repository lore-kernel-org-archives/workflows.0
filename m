Return-Path: <SRS0=/nb3=ZE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEFCC43331
	for <workflows@archiver.kernel.org>; Tue, 12 Nov 2019 10:44:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6111E206BA
	for <workflows@archiver.kernel.org>; Tue, 12 Nov 2019 10:44:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfKLKog (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 12 Nov 2019 05:44:36 -0500
Received: from www62.your-server.de ([213.133.104.62]:46390 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfKLKog (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 12 Nov 2019 05:44:36 -0500
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89_1)
        (envelope-from <daniel@iogearbox.net>)
        id 1iUTew-0004AR-TY; Tue, 12 Nov 2019 11:44:31 +0100
Received: from [2a02:1205:507e:bf80:bef8:7f66:49c8:72e5] (helo=pc-11.home)
        by sslproxy06.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <daniel@iogearbox.net>)
        id 1iUTew-0009kH-CJ; Tue, 12 Nov 2019 11:44:30 +0100
Subject: Re: Structured feeds
To:     Johannes Berg <johannes@sipsolutions.net>,
        Daniel Axtens <dja@axtens.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        patchwork@lists.ozlabs.org
Cc:     workflows@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        automated-testing@yoctoproject.org,
        Dmitry Vyukov <dvyukov@google.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <8736f1hvbn.fsf@dja-thinkpad.axtens.net>
 <20191106205051.56v25onrxkymrfjz@chatter.i7.local>
 <87h83eh2op.fsf@dja-thinkpad.axtens.net>
 <223b3b048f644b4d0fd854f9e360ed6d451c8241.camel@sipsolutions.net>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <a12245be-194d-4db3-a225-30d636946589@iogearbox.net>
Date:   Tue, 12 Nov 2019 11:44:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <223b3b048f644b4d0fd854f9e360ed6d451c8241.camel@sipsolutions.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.101.4/25630/Mon Nov 11 10:59:49 2019)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 11/9/19 8:41 AM, Johannes Berg wrote:
> On Sat, 2019-11-09 at 01:18 +1100, Daniel Axtens wrote:
>>>
>>   - code that efficiently reads a public-inbox git repository/folder of
>>     git repositories and feeds it into the existing parser. I have very
>>     inefficient code that converts public-inbox to an mbox and then
>>     parses that, but I'm sure you can do better with a git library.
> 
> Somebody (Daniel Borkmann?) posted a (very fast) public-inbox git to
> maildir converter, with procmail support. I assume that would actually
> satisfy this step already, since you can just substitute the patchwork
> parser for procmail.
> 
>>   - careful thought about how to do this incrementally. It's obvious how
>>     to do email incrementally, but I think you need to keep an extra bit
>>     of state around to incrementally parse the git archive. I think.
> 
> Not sure he had an incremental mode figured out there, but that can't
> really be all *that* hard, just store the last-successfully-parsed git
> sha1?

Yep, that is what it is doing, so that we only need to walk the repo(s)
upon a new git fetch to the point where we stopped last time.

Thanks,
Daniel
