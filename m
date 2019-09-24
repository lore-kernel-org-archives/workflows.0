Return-Path: <SRS0=lZea=XT=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2892C432C2
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 12:20:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A56DE214AF
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 12:20:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730220AbfIXMUX (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 24 Sep 2019 08:20:23 -0400
Received: from proxima.lasnet.de ([78.47.171.185]:44124 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbfIXMUX (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 24 Sep 2019 08:20:23 -0400
Received: from localhost.localdomain (p200300E9D742D21B26FCBF88D1F65952.dip0.t-ipconnect.de [IPv6:2003:e9:d742:d21b:26fc:bf88:d1f6:5952])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: stefan@datenfreihafen.org)
        by proxima.lasnet.de (Postfix) with ESMTPSA id 65A05C1AF4;
        Tue, 24 Sep 2019 14:20:20 +0200 (CEST)
Subject: Re: Kernel development collaboration platform wish list
To:     Paolo Bonzini <pbonzini@redhat.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <1811089.yxvLMk49Ug@kreacher>
 <2664c41b-e97c-4667-fb90-2eb37affea14@datenfreihafen.org>
 <8d1c457e-1661-5a5c-69d7-c17d4633b978@redhat.com>
From:   Stefan Schmidt <stefan@datenfreihafen.org>
Message-ID: <46bd4373-b7e1-6ea6-148c-cc15d881bbfd@datenfreihafen.org>
Date:   Tue, 24 Sep 2019 14:20:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <8d1c457e-1661-5a5c-69d7-c17d4633b978@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hello Paolo.

On 24.09.19 11:43, Paolo Bonzini wrote:
> On 17/09/19 20:40, Stefan Schmidt wrote:
>> (c) Git tag sanity checking
>>      Some maintainers have scripts for these, but not all. I still see
>> quite some mails about this coming from linux-next checking.
>>      1) ensure SOB by the actual author
>>      2) verify correct SOB/ACK/Reviewed tag usage (funny to see how often
>> things are manually added and gotten slightly wrong)
>>      3) verify Fixes: tag usage (min shasum length, one line without
>> break, etc)
>>
>> There are likely more.
>>
>> Where and how this is to be done I would leave open as this is only
>> requirements collection right now. I just feel that this kind of sanity
>> checking could be easily automated, hopefully without getting into the
>> way of maintainers.
> 
> This can be done by a "checkpatch"-like test.  If a full-blown
> checkpatch is undesirable (not sure why it would be, though), a special
> mode that only checks headers can be added to the script.

Sure, I do not really mind where this would sit. It is only a tiny piece 
and also quite easy to do compared to the more complex building blocks 
this will have.

Just brought it up as I have seen it here on there on netdev where a 
missing SOB or a wrongly formatted Fixes tag needed some manual labor to 
explain it.

regards
Stefan Schmidt
