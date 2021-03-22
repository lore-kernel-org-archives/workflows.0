Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A46C433E0
	for <workflows@archiver.kernel.org>; Mon, 22 Mar 2021 19:51:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 523926196C
	for <workflows@archiver.kernel.org>; Mon, 22 Mar 2021 19:51:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhCVTuW (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 22 Mar 2021 15:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbhCVTtz (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 22 Mar 2021 15:49:55 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352F3C061574;
        Mon, 22 Mar 2021 12:49:55 -0700 (PDT)
Received: from ip4d142c50.dynamic.kabel-deutschland.de ([77.20.44.80] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1lOQYi-0000OW-Up; Mon, 22 Mar 2021 20:49:53 +0100
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ksummit-discuss@lists.linuxfoundation.org,
        workflows@vger.kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <613fe50d-fc9c-6282-f1f3-34653acb2ee9@leemhuis.info>
 <CAKXUXMw7kHBPov23kF1HUBrW9DL+huqAG8ZRLJwGgU67nCOPeg@mail.gmail.com>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [Ksummit-discuss] RFC: create mailing list "linux-issues"
 focussed on issues/bugs and regressions
Message-ID: <4dcc2b8e-719e-e171-f236-9b28c8c0bae9@leemhuis.info>
Date:   Mon, 22 Mar 2021 20:49:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMw7kHBPov23kF1HUBrW9DL+huqAG8ZRLJwGgU67nCOPeg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1616442595;4e498859;
X-HE-SMSGID: 1lOQYi-0000OW-Up
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 22.03.21 17:55, Lukas Bulwahn wrote:
> On Mon, Mar 22, 2021 at 4:38 PM Thorsten Leemhuis <linux@leemhuis.info> wrote:
>> Lo! I want to provide users with an easier way to search our multitude
>> of mailing lists for reports about issues (aka bugs), as reporting the
>> same kernel problem multiple times has known downsides for everyone
>> involved. That's why I propose to create this new mailing list:
>>
>> linux-issues@lists.linux.dev
>>
>> Developers and users reporting or handling issues then can CC it or
>> search it via lore. But this will only fly if the idea has buy-in from
>> at least the core kernel maintainers, to make sure they and the
>> developers actually use it. That's why I'm looking for feedback with
>> this mail and also CCed ksummit-discuss, as that's the easiest way to
>> make sure maintainers get aware of this idea and can raise their voice.
>>
>>
>> Note, there is a second reason why ksummit-discuss is CCed: another
>> reason why I want to create this new list is making it easier to find
>> and track regressions reported to our various mailing lists (often
>> without LKML in CC, as for some subsystems it's seems to be custom to
>> not CC it). Back on the maintainers summit in 2017 it was agreed to
>> create a dedicated list for this purpose
>> (https://lwn.net/Articles/738216/). I even requested a
>> "linux-regressions@vger.kernel.org" a while later, but didn't hear
>> anything back; and, sadly, about the same time I started having trouble
>> finding spare time for working on regression tracking. :-/
>>
>> But I soon will get back into that area:
>> https://linux-regtracking.leemhuis.info/post/hello-world/ Hence it's a
>> good time to prepare some groundwork for that. But these days I think
>> having something like linux-regressions@lists.linux.dev might be over
>> engineered, at least for now: a linux-issues@lists.linux.dev with a
>> simple "[regressions]" in the subject will suffice, as that tag is
>> something a lot of people are used to already. And if we think we need
>> that list we can still create it in the future. Or what do you folks
>> think about it?
> 
> Thorsten, I generally support this initiative. I am just wondering:
> 
> What is the definition of an issue for you?

Good question, but that is up to us. But FWIW, here is my stance:

> Just four examples that come to my mind:
> 
> - all the warnings that Stephen Rothwell reports on linux-next, such
> as https://lore.kernel.org/linux-next/20210322170452.726525e8@canb.auug.org.au/
> or https://lore.kernel.org/linux-next/20210322075108.3967d5d1@canb.auug.org.au/?

I'd have no problem with those, but those are more devel internal issues
and nothing users would face, so I'm don't think it will buy us anything.

> - all the issues that the kernel test robot reports?

I'd say so, at least those that are regressions, as I want to track them ;-)

> - all the errors and warnings that kernel ci reports? Basically, each
> "issue" that is already aggregated in this email,
> https://lore.kernel.org/linux-next/6058787c.1c69fb81.d3f10.8c6d@mx.google.com/?
> - all the syzbot reports?
>
> Are you including all those automatic testing and checking efforts as
> reporting valid "issues"?

Well, the purpose of that list would be "make it easier to find existing
reports". Too much noise works against that, so we should try to limit
it, so maybe those are better left out, unless it's something we known
users might face.

> Or would you like to keep this list only for
> reports from single individual human users that need to detect the
> "issue" without using one of the tools above?

Guess something like that might be best strategy.

Ciao, Thorsten
