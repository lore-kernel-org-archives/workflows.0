Return-Path: <SRS0=FCe/=XV=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4501DC4360C
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 13:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 21440222C0
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 13:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfIZNkG (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 26 Sep 2019 09:40:06 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:33570 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfIZNkG (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 26 Sep 2019 09:40:06 -0400
Received: by mail-ot1-f51.google.com with SMTP id g25so2046763otl.0
        for <workflows@vger.kernel.org>; Thu, 26 Sep 2019 06:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cTsMlgsp6r3bK4lu+HDM/LWa8pDVFQHXWfQ8nP+vUe4=;
        b=HnnwsTENZhyaT2BBuub/e//f5Ix2fRdrWa+x8hYYr5hKe8d0dEt3yuVmQJNYuTZPm6
         fwGhAVhc5qo8epuobTmtd24hlJS0Zq7LdGmSNpWRxUvzphGkuSdbQR9Q5PHFy+Y/rgLa
         T1Dgm1oGygu0zjow1SjMzX1lejVYTw1W1IBBNslRomCUFXNBE7nYSHPUzwVG+YEw13wH
         RqG4rGYRYyh4EkjPuVbxCdTzSMdj+A0ozhRR0NVvBz3VQaj8OQTYwfjgT4ymflgi4i+L
         zuPuetHz4iUbja8zwOyEyx+04XKwDiiBplTWJBz+2l+4tzqbALqSRRUYkQB0AZqFYi8d
         vtqQ==
X-Gm-Message-State: APjAAAUxVP6X+CuuzOrfQAICI3rrdQnMcyRaIvdOdRqOlg5QmVInrM3v
        NPFe/ErkeArQ4IE8SUnrwSGPkNYnpwYykz2KHWBjh3EM2x8=
X-Google-Smtp-Source: APXvYqwGAW6K87D15rl5N212a653ig42vhEro3PXYXT2l9qH2uzlHwzIpWkNDVyA/1glkqo30NAEGWRwoDMVtxiSX/o=
X-Received: by 2002:a9d:404d:: with SMTP id o13mr2700494oti.39.1569505205633;
 Thu, 26 Sep 2019 06:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <1811089.yxvLMk49Ug@kreacher> <20190923162001.GD6005@mit.edu>
 <CAMuHMdX31h-VEf0bCjdTTLSO8xwMdE1cR9GsQ2tEk4PSHOPctA@mail.gmail.com> <575CE8BF-4C3A-4AEB-8749-9D2B92FCD4D3@goodmis.org>
In-Reply-To: <575CE8BF-4C3A-4AEB-8749-9D2B92FCD4D3@goodmis.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 15:39:54 +0200
Message-ID: <CAMuHMdUySTyRmuCrCbW61LYbsF_5Jvd7P=mhjGSB0oR2Ec+b3Q@mail.gmail.com>
Subject: Re: Kernel development collaboration platform wish list
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Sep 26, 2019 at 3:02 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> That would be wonderful.

Oh, the irony ;-)

> -- Steve
>
> On September 26, 2019 12:18:18 PM GMT+02:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:

[...]

> >And if it's done right, it may solve (or make it harder to show) other
> >bad review
> >behavior, like:
> >  - Top posting review comments,
> >- Quoting a 2000-line patch when commenting on a single line deep down.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
