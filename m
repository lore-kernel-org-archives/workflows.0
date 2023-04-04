Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4182FC6FD1D
	for <workflows@archiver.kernel.org>; Tue,  4 Apr 2023 05:58:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233342AbjDDF6o (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 4 Apr 2023 01:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbjDDF6n (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 4 Apr 2023 01:58:43 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2F31992;
        Mon,  3 Apr 2023 22:58:42 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pjZgm-0008WR-G0; Tue, 04 Apr 2023 07:58:40 +0200
Message-ID: <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
Date:   Tue, 4 Apr 2023 07:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US, de-DE
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org, aros@gmx.com,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
        tools@linux.kernel.org
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: Introducing bugbot
In-Reply-To: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1680587922;b9893b0d;
X-HE-SMSGID: 1pjZgm-0008WR-G0
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 03.04.23 23:45, Konstantin Ryabitsev wrote:
> 
> Per our discussion last fall, I've been working on a bridge between bugzilla
> and public-inbox, which went live in the past few days. It's still a very
> early release, but it can do the following:

thx for working on this.

>    New bugs will be created in the Linux/Kernel component of Bugzilla, but
>    they can then be reassigned to any other component. As long as they remain
>    open, bugbot will continue tracking threads for new messages until either
>    the bug is closed, or it has been over 30 days since any activity on the
>    bug.

30 days from my experience sounds too short for me (but I have no hard
numbers to back this up). I would have gone for 90 days, but I guess
that would create too much load?

> [...]
> 2. Start mailing list threads from pre-triaged bugzilla bugs. This works the
>    opposite way and creates mailing list threads based on bug reports filed in
>    bugzilla. The useful things here are:
> 
>    - bugbot only gets triggered on open bugs in Linux/Kernel that have the
>      "bugbot" flag set to "+", which allows pre-triaging a bug before bugbot
>      sends it to the mailing list
>    - there is a special "cf_subsystem" field added to that component; bugbot
>      will match it verbatim to the MAINTAINERS file components and will send
>      mail to the M: and L: addresses for that subsystem
>    - bugbot will then monitor for any updates to that thread, so any mailing
>      list replies will be added as comments to the bug (thus sending a
>      bugzilla mail notification to the initial author)
> [...]

Would be great if bugbot could CC the regressions list for all bugs that
have the regressions flag set to "yes"

How does one make bugbot forward a bug to everyone in the signed-off-by
chain of a commit that caused a regression, which might or might not
have a bugzilla account?  When the reporter performed a bisection these
are the primary contacts that need to be reached out to, but the
maintainers and lists for the subsystem obviously should be CCed.

Ciao, Thorsten
