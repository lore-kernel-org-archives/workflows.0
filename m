Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59130C433F5
	for <workflows@archiver.kernel.org>; Sun,  2 Oct 2022 21:07:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiJBVHv (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 2 Oct 2022 17:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiJBVHu (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 2 Oct 2022 17:07:50 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A5B2CDC3
        for <workflows@vger.kernel.org>; Sun,  2 Oct 2022 14:07:49 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-131dda37dddso10103987fac.0
        for <workflows@vger.kernel.org>; Sun, 02 Oct 2022 14:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=uJ9dwtxfZ7QDsWihPeAk/whJT6OEIJZ9L68Sp/smDb8=;
        b=fVw0+JqglxpVoZs6aXw9kNt0YWj70Gn920A8unExF66Z7OOFf4P8ITJU0n7X2HXTpl
         5Y7YHBnpfYisZC7N0iVTAvORxzUCdZpTrkU545srbzIZQyYdbTBonec9WSLe1yj19kRE
         jehU7PYjG1eaq0/zPxMxklHdq1z9W/0nebmhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uJ9dwtxfZ7QDsWihPeAk/whJT6OEIJZ9L68Sp/smDb8=;
        b=ev7k3yLCOilv+z4Osw3eDWhQLuYfRLviK2IaP8D1kcOO3fV9SDJeiKg0bfo4oQJjm3
         tIok1pXLiiFe+Pvz6bG1nm3ajmSeQl9/RhjbpnlTCbFjAQfL9Loo+/vkZSsLWoLZPtzT
         py9Z+x+AgaH7StIZsKYlowx1AW/eItWgDVZJC1DHV4rBLwG/4o/0HiLvaNf5rbFSuJbv
         WCq7wBh9ZFINiM5XQ1fDY6mJKcUWxlij96/x/Gre1FkguxCJMCjfM1Qd7NlmtJc5acIl
         T/3h7tJlrkJKvVNHAmU2H3ammRPss2wwtwP+fGe9m3aUS4CI66Vp1EItrNrl7wrrsGny
         TFmQ==
X-Gm-Message-State: ACrzQf2YiuHYb8+FrpC0n7I4pCKhCAbzCdkiht2lXo4ts1G73BFzEsAN
        Z4t8gQgQMcYJVPtfOcT0lJEf7mCR1DRgUg==
X-Google-Smtp-Source: AMsMyM5DRy66/FPSRhD1dhh91xsix6Pe/XedHKrpffqOF+IwjwrMgz7xnphZOIAmpYE4ACSBNwA+Nw==
X-Received: by 2002:a05:6870:4587:b0:12d:97b0:b083 with SMTP id y7-20020a056870458700b0012d97b0b083mr3870052oao.213.1664744868857;
        Sun, 02 Oct 2022 14:07:48 -0700 (PDT)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id o4-20020a9d7644000000b006370b948974sm1982995otl.32.2022.10.02.14.07.46
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 14:07:46 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-131ea99262dso8801029fac.9
        for <workflows@vger.kernel.org>; Sun, 02 Oct 2022 14:07:46 -0700 (PDT)
X-Received: by 2002:a05:6870:c0c9:b0:127:c4df:5b50 with SMTP id
 e9-20020a056870c0c900b00127c4df5b50mr3818161oad.126.1664744866051; Sun, 02
 Oct 2022 14:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com> <YzgY9X/DM9t/ZuJe@kroah.com>
 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com> <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com> <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <YzmhoglDyEf3z0n8@kroah.com> <ce0b5780-a8cd-83fc-5b91-3acc574f426e@gmx.com>
 <CAHk-=wiGZEGY7kDXSD3ryL3yJ6fMp-+zzdyRFUc30kW+512-2w@mail.gmail.com> <7d57b7d2-b39a-881c-65e6-969c4f0948cc@gmx.com>
In-Reply-To: <7d57b7d2-b39a-881c-65e6-969c4f0948cc@gmx.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 2 Oct 2022 14:07:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjfAERC3XjZ=rF8HM+Q52LD-j_EEtv0hhiyhi6PC6MCUA@mail.gmail.com>
Message-ID: <CAHk-=wjfAERC3XjZ=rF8HM+Q52LD-j_EEtv0hhiyhi6PC6MCUA@mail.gmail.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
To:     "Artem S. Tashkinov" <aros@gmx.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        ksummit@lists.linux.dev,
        Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sun, Oct 2, 2022 at 1:56 PM Artem S. Tashkinov <aros@gmx.com> wrote:
>
> I just want a bugzilla where I can CC _any_ developer _if_ and _only if_
> they are willing to work within its confounds. That's it.

Guess what that "add develooper to the Cc" is called?

Email.

What you do is fill in the bugzilla entry with all the data you want.

Then you use email to inform people about it.

Put enough data in the email that the developer knows whether it's
even worth looking at the bugzilla entry or not. Don't just put a link
to the bugzilla. Most developers will just go "oh, this looks like
spam"., Put the overview in the email, enough information that the
developer can go "Ahh, this is worth my time", _and_ the link to
bugzilla.

That gives you exactly what you ask for: you can CC _any_ developer.
And it doesn't force the developer to have to go to some bugzilla web
interface unless the developer thinks it actually adds value.

This is *literally* how I end up using bugzilla. As you say, I
actually do end up looking at bugzilla entries in the end, but I only
do it once it has hit my mailbox first, and I have some fairly good
indication that it's worth my time to look at it.

And yes, for some projects and for some developers you can do that
email integration from within bugzilla itself. That's how people reach
me.

But this is exactly the kind of part of bugzilla that is a TOTAL
HORROR-SHOW to manage, and it's impossible to expect every developer
to be somebody that can be listed on bugzilla, without bugzilla
becoming a prime way to send spam.

Which is why in the general case, you really should consider email to
be the "lingua franca" of kernel development communication.  It
doesn't have the fundamental limitations and management issues that
bugzilla has. If you want to add more people to the Cc in an email,
you just do it.

             Linus
