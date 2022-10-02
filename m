Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB36DC433FE
	for <workflows@archiver.kernel.org>; Sun,  2 Oct 2022 20:46:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiJBUqh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 2 Oct 2022 16:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbiJBUqg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 2 Oct 2022 16:46:36 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783C725C5D
        for <workflows@vger.kernel.org>; Sun,  2 Oct 2022 13:46:35 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-132555b7121so2069079fac.2
        for <workflows@vger.kernel.org>; Sun, 02 Oct 2022 13:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=GA1eijPhe2qLHfwUccL2m31o18WRn+HtU/gv3+g46xc=;
        b=OQ5Fdojd2dOl5xXkqKGgU5wBp9DAbTQrcyIlOkSTvNgzB+qErBRKm4zcjxEI9C4Trc
         KNjmKitUVAp3JCwG2LUbHYnaMpen+vbGQxlsJperGdZuHM8s4F9EwhUbN8CR2zsL7RyE
         KeOYBIUftyho6wUoyQTJmezJBUVx4kY5Bed5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=GA1eijPhe2qLHfwUccL2m31o18WRn+HtU/gv3+g46xc=;
        b=6UdOBiaUf1Rdun+5YLNLKsPHQ8wgVDBijDzOtlpujoiMxtVm9pL99ocMyxpoOBg8X/
         kV+Qa//IWvqfZoUE0c7E4ptX2c3YGtUG7CrGyrufiROmoLMDFRmbevHl153j2YsQ9qwq
         8E5Tu1okrKwNUR1e08Pet3/XCx5o0HLou6hTVxt0BAPHep2cwBHbglRB/oEda77JxTT9
         PKla/25nKccsx9iDaVs+2crNF2mty06HQJnnjUfseZcywzyfV41+TtTnaeWxBSMZ9rK+
         II3c0hyhfBuTSb0/iVcGFGxIYF0h11B2eagSSmBlAy0dcUiOdKYPYa5uMUV+l0NVWjUX
         1Qzg==
X-Gm-Message-State: ACrzQf2J8E+I7Y6jYHcyONVm+2/RG2N/6GKEjcIOgCSIen36m3jLwhmD
        0rK4L1CevAm2kdLJxTd52bei8VXUiXvUJQ==
X-Google-Smtp-Source: AMsMyM567z5bxehmw3ao+5nVx++UQUdzhlvfbGtMvC+AHlpWlKJocl1bwgH+NzgNhSTxagwn+0d5hQ==
X-Received: by 2002:a05:6870:b69e:b0:132:7a25:b1a2 with SMTP id cy30-20020a056870b69e00b001327a25b1a2mr387919oab.206.1664743592304;
        Sun, 02 Oct 2022 13:46:32 -0700 (PDT)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com. [209.85.161.53])
        by smtp.gmail.com with ESMTPSA id ce4-20020a056830628400b00660a927e3bcsm125957otb.25.2022.10.02.13.46.26
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 13:46:27 -0700 (PDT)
Received: by mail-oo1-f53.google.com with SMTP id c13-20020a4ac30d000000b0047663e3e16bso5620764ooq.6
        for <workflows@vger.kernel.org>; Sun, 02 Oct 2022 13:46:26 -0700 (PDT)
X-Received: by 2002:a05:6830:611:b0:65c:26ce:5dc with SMTP id
 w17-20020a056830061100b0065c26ce05dcmr7102608oti.176.1664743586515; Sun, 02
 Oct 2022 13:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com> <YzgY9X/DM9t/ZuJe@kroah.com>
 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com> <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com> <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <YzmhoglDyEf3z0n8@kroah.com> <ce0b5780-a8cd-83fc-5b91-3acc574f426e@gmx.com>
In-Reply-To: <ce0b5780-a8cd-83fc-5b91-3acc574f426e@gmx.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 2 Oct 2022 13:46:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiGZEGY7kDXSD3ryL3yJ6fMp-+zzdyRFUc30kW+512-2w@mail.gmail.com>
Message-ID: <CAHk-=wiGZEGY7kDXSD3ryL3yJ6fMp-+zzdyRFUc30kW+512-2w@mail.gmail.com>
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

On Sun, Oct 2, 2022 at 12:27 PM Artem S. Tashkinov <aros@gmx.com> wrote:
>
> It's so weird to read this I'm just dumbfounded.

The *real* dumbfoundedness here is how you seem to think you have the
right to tell people how to work, when you've been told over and over
how bugzilla doesn't fit in the workflow, and isn't worth the effort
and time.

And when people tell you that if you care about bugzilla, then it is
*you* who should spend the time there, you say that you are
dumbfounded. Because only you can tell people how they should work,
right?

Please go away, and look in the mirror a bit.

                  Linus
