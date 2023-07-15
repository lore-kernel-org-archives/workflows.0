Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839F5C0015E
	for <workflows@archiver.kernel.org>; Sat, 15 Jul 2023 11:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjGOLaN (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 15 Jul 2023 07:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjGOLaM (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 15 Jul 2023 07:30:12 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D5330C6
        for <workflows@vger.kernel.org>; Sat, 15 Jul 2023 04:30:08 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1qKdTT-0004Oy-5s; Sat, 15 Jul 2023 13:30:07 +0200
Message-ID: <8c18ee62-2647-92f1-6430-5af650f8bc11@leemhuis.info>
Date:   Sat, 15 Jul 2023 13:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US, de-DE
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     "workflows@vger.kernel.org" <workflows@vger.kernel.org>,
        Linux kernel regressions list <regressions@lists.linux.dev>
References: <8133fcf4-5ed6-204a-ceb1-ee4136e32fb4@leemhuis.info>
 <20230711-encore-hunchback-2d103b@meerkat>
 <10064cba-f0fe-fbc6-0c3a-97be48360a05@leemhuis.info>
 <20230714-zion-margin-natasha-a66ce1@meerkat>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: Bugbot for all kernel bugs?
In-Reply-To: <20230714-zion-margin-natasha-a66ce1@meerkat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1689420608;26a25cfb;
X-HE-SMSGID: 1qKdTT-0004Oy-5s
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 14.07.23 22:19, Konstantin Ryabitsev wrote:
> On Thu, Jul 13, 2023 at 01:45:58PM +0200, Thorsten Leemhuis wrote:
>>> So, we can't easily do "enable for all the bugs" because the bot was written
>>> with the idea that it would be invoked per-component. Is there a bugzilla
>>> component (and a matching mailing list) that you have in mind for the bot?
>>
>> Ugh. :-/ Well, as you can see from a quick search like
>> https://lore.kernel.org/all/?q=%28nq%3A%22noticed+a+regression+report+in+bugzilla.kernel.org%22+f%3Aleemhuis%29+OR+%28nq%3A%22I+notice+a+regression+report+on+Bugzilla%22+f%3Asanjaya%29
>> we have to deal will bug reports for many different components. So it
>> would be great if it could be enabled for all products/components, except:
>>
>> * all components from the product categories "Alternate Trees",
>> "Backports project", "Documentation", "kernel.org", and "Tools"
>>
>> * "Bug Tracker", "klibc/kinit", "module-init-tools", and "Spam" from the
>> product category "Other"
>>
>> There might be a few more that are obsolete hidden in the other products
>> categories (like "PS3" in "Platform Specific/Hardware" or "lguest" in
>> "Virtualization")
>>
>> Did I say "Ugh" already? Ohh, seems I did. :-/
>>
>> So how do you suggest to move forward
> 
> One of the main drives behind bugbot was to eliminate as many components as
> possible and just let people file bugs under "Linux/Kernel". The "bug
> wrangler" people would then do initial triage

So bugs that people file for products/components that will remain won't
get triage? Wondering if that is a wise idea, but whatever, that is
nothing I'd consider a blocker, so let see.

> and set the "Subsystem" field to
> match an entry from MAINTAINERS. Then, they would set the "bugbot" flag to "+"
> and let the bot do the rest, fully bridging bugzilla with the mailing lists.
> 
> So, in my perfect little world we'd:
> 
> 1. identify products/components that we can abandon right away and close them
>    for new bug entry
> 2. identify the "bug wranglers" who can do the initial triage and grant them
>    the power to set the "bugbot" flag
> 3. catch and fix the bugs
> 
> We can start with #1 if everyone is happy with this course of action.

Hmmm, that's fine with me, but all that will take some time, hence allow
me to ask: if there a downside (much work?) to simply enable it now for
lots of other products/components until 1 and 2 are realized?

Ciao, Thorsten
