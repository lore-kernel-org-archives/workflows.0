Return-Path: <SRS0=Mr7I=Y5=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD68C010A3
	for <workflows@archiver.kernel.org>; Tue,  5 Nov 2019 10:46:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4743C2190F
	for <workflows@archiver.kernel.org>; Tue,  5 Nov 2019 10:46:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730633AbfKEKqm (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 5 Nov 2019 05:46:42 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:33633 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbfKEKqm (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 5 Nov 2019 05:46:42 -0500
Received: by mail-oi1-f169.google.com with SMTP id m193so17095242oig.0
        for <workflows@vger.kernel.org>; Tue, 05 Nov 2019 02:46:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jjbjmvqXXJ/DDD2pTAFehtI/WWlNCFD6bd1QCA9r/hQ=;
        b=fplYZuUO40YcaOygo9F8k+DPH2dhTTdGP/mC90i9Znir39X8JRz06xhheQSuNrywhz
         7fmRA7Gpim83IAm+y4o7pK5C3VnYgiubFqiUu3fm5y3U/DWRFDILbdAx9li+3zQQXr1f
         h2VnmGtDTBdxot042ZwYB2XYQEzvC2BBDSbrrZQRWnuZfcCgEC47ZnZ9Hh52+P3wYpDO
         xQwCuEMe49WfcaMR4YdNgvcOxaNd8LVWW2+K9e5EhE+1WuDZ1At0WCAKfT40I3PHBMrR
         yKvIFIUyWs31okYxEtiobVyL0WlqfQ6NPxwQ4ny51glH/biZWxTnImuYhxCqHCbNihws
         qW8g==
X-Gm-Message-State: APjAAAU4HvXBJ2xFakexiEzxWU5i+n2b6z0r+Eh6Rt3fSwdJGn4S2/SP
        RxBKgNtfwAqL7VVQo1LHG4ycO6G5+PYx+wbnHPw=
X-Google-Smtp-Source: APXvYqy93RvtRKZ2ZV5wMrFDgBemS+TI+cX5qunDBpTNDAMKKLUDLywMGPSU6fanALWBcWkMqocnoXjzEDZq75EY41M=
X-Received: by 2002:aca:882:: with SMTP id 124mr2656933oii.54.1572950801572;
 Tue, 05 Nov 2019 02:46:41 -0800 (PST)
MIME-Version: 1.0
References: <20191101022746.GA25491@dcvr> <20191101090456.GD2671695@kroah.com>
 <20191104131310.GE28764@mit.edu> <CACT4Y+atKXTqfjSCjzhf_P0MT+fQT-vP90nfct__BaiF2qiK0A@mail.gmail.com>
 <87sgn37l2t.fsf@intel.com> <CAMuHMdXFRx6f1PqAqCxDJn4gpr4+HiHZTn3tuS=_Yq92j_Lzeg@mail.gmail.com>
In-Reply-To: <CAMuHMdXFRx6f1PqAqCxDJn4gpr4+HiHZTn3tuS=_Yq92j_Lzeg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Nov 2019 11:46:30 +0100
Message-ID: <CAMuHMdXDwMkAyg5thonW-Tt9RX2DNVe3bPd+hVFhtXY7_p8eMA@mail.gmail.com>
Subject: Re: patch attachments still unwelcome?
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Greg KH <gregkh@linuxfoundation.org>, Eric Wong <e@80x24.org>,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Jani,

On Mon, Nov 4, 2019 at 6:40 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Nov 4, 2019 at 3:52 PM Jani Nikula <jani.nikula@intel.com> wrote:
> > Typically you'd have a multipart/mixed MIME message with several parts
> > of various Content-Types. In this case presumably text/plain, but
> > text/x-diff is not out of the question for patches. Also seen a lot of
> > application/octet-stream for logs.
> >
> > You can give a *hint* to the recipient MUA on how to interpret each part
> > by setting Content-Disposition: attachment or inline. Bottom line,
> > whether you can control that in your MUA, and whether the recipient MUA
> > actually respects that is anyone's guess.
> >
> > For fun, this multipart message contains three parts, the one you're
> > reading, and two additional parts, one of which should be inline and the
> > other one an attachment.
>
> So the Gmail web interface shows both as attachments, but can show
> the contents when I click on them.
> The Gmail Android app shows both as attachments, and forces me to
> download the attachments to read them, using a selected app.

Just for fun, I tried alpine, which I still use from time to time.

Alpine shows the first one "sort of" inline, at the bottom:

| --
| Jani Nikula, Intel Open Source Graphics Center
|
|
|     [ Part 2: "Attached Text" ]
|
| This is supposed to be inline.
|
|
|     [ Part 3, Text/PLAIN 2 lines. ]
|     [ Not Shown. Use the "V" command to view or save this part. ]

But when replying, the "inline" one is not quoted, so I can't provide
review comments.

> Ergo, no attachments is the safest.

Unless your patches are perfect, and will receive no comments but
RoB or AB tags ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
