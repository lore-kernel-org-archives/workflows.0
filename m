Return-Path: <SRS0=JBIR=XW=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB415C4360C
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 07:50:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE8D52075D
	for <workflows@archiver.kernel.org>; Fri, 27 Sep 2019 07:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfI0HuH (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 27 Sep 2019 03:50:07 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:37862 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfI0HuH (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 27 Sep 2019 03:50:07 -0400
Received: by mail-oi1-f179.google.com with SMTP id i16so4436440oie.4
        for <workflows@vger.kernel.org>; Fri, 27 Sep 2019 00:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DVstcPugeHbeSjlhu9Qk7kmbfTIJsb4e+WdFqF5hSWI=;
        b=XSISUpES25wo7oHs/fMijtN1EywFWty+U2sT7oZcC583Gw1FX0pahBmo1HgSk2o1Z1
         /t/GnPC5Ox5XGgvSYDGej3pHjTvtH/+2aI6cRlNaFIFpyz+aanqtq/VG6+HIVOW2Loa2
         hjULprNarPa9iLY6w9WJP7DiNyAbIljUFeRmHXN4bIQtVcailD/T6ejN+8GDZZS0JEx0
         iKPYh0P/y/a6rkdewgOQY7ibyhocdNhIepxM9TbhogZcUmmGuhRxxeddtKIcZSP151d5
         6/OYPPaSn2X+J9cZRFr1drVZ1Xy6nnS1dOrJD+5/LbmvsXD/8jFd24G3ge3bt1MUe5UN
         fyHw==
X-Gm-Message-State: APjAAAWowmiC4EnD4bePGI5UR+e8KLEUsbgY1fORCjwg8DIg8KLdOq0e
        hiCHTFpEu4iQTIu5jOf92c2jEgyDRWewJ+TnIECXiEv/
X-Google-Smtp-Source: APXvYqyBLZGRLLsDLviitrX3FIcArwXHt91TpUdIgydliNI5EaEi8O9v2VAxvV+AGKi8Oi/PZ4qRHNQ/+BPg6d2bFJ8=
X-Received: by 2002:aca:dad4:: with SMTP id r203mr6120945oig.102.1569570606122;
 Fri, 27 Sep 2019 00:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190926195143.GA1742392@kroah.com>
In-Reply-To: <20190926195143.GA1742392@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Sep 2019 09:49:55 +0200
Message-ID: <CAMuHMdUq3if8bF0KatS+gWSa4mBvGk0Z8oyoOpeUj=AMTYbMkA@mail.gmail.com>
Subject: Re: script to check "Fixes:" tags
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Greg,

On Thu, Sep 26, 2019 at 9:51 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> Since this list was created to share scripts, here's one that I
> currently use to test that the "Fixes:" tags are correct on a commit.  I
> run it on all patches that I accept into my trees, after getting emails
> from Stephen one too many times :)
>
> It's almost entirely based on Stephen's original script, but has been
> changed a bit in formatting and usage to be a stand-alone script that
> anyone can use.
>
> To use:
>         verify_fixes.sh GIT_RANGE
>
> if all is good, script will print nothing out and exit with success.  If
> there is a problem it will be printed out and the script will exit with
> an error that you can check from any other program.
>
> It it 'shellcheck' clean, but I'm sure that there are other things wrong
> with it, so feel free to point out problems.

Thanks!

> And should stuff like this be in the kernel tree itself?

Probably this should be integrated into checkpatch.pl?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
