Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDA9C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 22:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1493B2084C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 22:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfJKW5Q (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 18:57:16 -0400
Received: from www62.your-server.de ([213.133.104.62]:41412 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbfJKW5Q (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 18:57:16 -0400
Received: from sslproxy01.your-server.de ([88.198.220.130])
        by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89_1)
        (envelope-from <daniel@iogearbox.net>)
        id 1iJ3qU-0006Ns-Pp; Sat, 12 Oct 2019 00:57:14 +0200
Received: from [178.197.249.55] (helo=pc-63.home)
        by sslproxy01.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <daniel@iogearbox.net>)
        id 1iJ3qU-0003TZ-ID; Sat, 12 Oct 2019 00:57:14 +0200
Subject: Re: RFC: individual public-inbox/git activity feeds
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
References: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
From:   Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <a527b3cb-d5e7-dc92-2ec0-a4052ffd8106@iogearbox.net>
Date:   Sat, 12 Oct 2019 00:57:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.101.4/25599/Fri Oct 11 10:48:23 2019)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 10/10/19 9:28 PM, Konstantin Ryabitsev wrote:
[...]
> # Individual developer feeds
> 
> Individual developers can begin providing their own public-inbox feeds.
> At the start, they can act as a sort of a "public sent-mail folder" -- a simple tool would monitor the local/IMAP "sent" folder and add any new mail it finds (sent to specific mailing lists) to the developer's local public-inbox instance. Every commit will be automatically signed and pushed out to a public remote.
> On the kernel.org side, we can collate these individual feeds and mirror them into an aggregated feeds repository, with a ref per individual developer, like so:
> 
> refs/feeds/gregkh/0/master
> refs/feeds/davem/0/master
> refs/feeds/davem/1/master
> ...
> 
> Already, this gives us the following perks:
> 
>   - cryptographic attestation
>   - patches that are guaranteed against mangling by MTA software
>   - guaranteed spam-free message delivery from all the important people
>   - permanent, attestable and distributable archive
> 
> (With time, we can teach kernel.org to act as an MTA bridge that sends actual mail to the mailing lists after we receive individual feed updates.)
[...]

[...]
>   - we still continue to largely rely on email and mailing lists, though    theoretically their use would become less important as more    developer feeds are aggregated and maintainer tools start to rely on    those as their primary source of truth. We can easily see a future    where vger.kernel.org just writes to public-inbox archives and    leaves mail delivery and subscription management up to someone else.

[...]
> The main upside of this approach is that it's evolutionary and not revolutionary and we can start implementing it right away, using it to augment and improve mailing lists instead of replacing them outright.

I do like these aspects, and the receive side aka git to mail client integration is already done,
so the one missing piece is a sendmail drop-in replacement acting as public git sent-mail folder.
I think it doesn't have to be on kernel.org, but could live anywhere e.g. developers could also
push to github or elsewhere with such tool, so "subscribing" to a mailing list for sending would
need kernel.org infra that adds the repo to a list of repos to pull from, extracts <commit hash>:m
from that developers repo from the point where it was last read up to the git HEAD (e.g. rejecting
any forced pushes, and doing sanity checks on m), and m would then be committed conflict-free to
the official public-inbox repositories of the lists in Cc in m, and potentially sent from kernel.org
via MTA bridge to old-style mail receivers. Nice thing is that this would allow for transparent
testing/roll-out to today's development workflow. It might be one component/(sub-)tool of the bigger
picture to have email slowly fade out (and new/non-mail based tools could be built around it, too).

Thanks,
Daniel
