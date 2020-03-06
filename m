Return-Path: <SRS0=PQGV=4X=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB0AC10DCE
	for <workflows@archiver.kernel.org>; Fri,  6 Mar 2020 16:53:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FB142073D
	for <workflows@archiver.kernel.org>; Fri,  6 Mar 2020 16:53:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgCFQxh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 6 Mar 2020 11:53:37 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37123 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgCFQxh (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 6 Mar 2020 11:53:37 -0500
Received: by mail-ot1-f67.google.com with SMTP id b3so3071037otp.4
        for <workflows@vger.kernel.org>; Fri, 06 Mar 2020 08:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5uFXFOYUcaNYVHcTjYqDjsPoBz/yvaLhBqJNK8ygFks=;
        b=FWX1RaxO9l/QLBNpSjwTR9Nt0/gxYV0xKPNaegW3eKnn99q8Q9l3O7HnH1ONSEi0gX
         Io5lSxOALo5fUxNPnC/SmbbbNguL1KpXoNzavr4VuJvqHEb2N+WLTT96+2QOTTp9jiPF
         ESx7bu1/J0A+XWwdDj8Xgi7JyrjQVnPO1xyrRIJY9VusmWLr9+NLrS8HhTLHIOQsclRW
         lEL7P3vI04h65cULaLTcg20nsA6NCEDyenjgesxTVTYC9ltqrDTLeZjR5chgvFKxU/k6
         Gdta8a9h+gSSEELdqaCyhpgKUMLdqQMTyijh7Z40w2eiczkHpng5YMrm1dhA+DcobJ11
         Ztpg==
X-Gm-Message-State: ANhLgQ2/lVc4QgESna/1LBp9Y0hKtSowDhIBh3fc8S7/A3dKSLrRvnpk
        COM+dp27gjr7kJ2Pkv/BFATJ/bo6o2dMLJRUx2s=
X-Google-Smtp-Source: ADFU+vueLd9x5zHudvSARgJdmNm883TLm7kIy7Y2qnbOruex68HWhe+7VMMLSfLC1mrK6U1+1gbrRYXPXV/NgyhGQPA=
X-Received: by 2002:a05:6830:1e9c:: with SMTP id n28mr3164256otr.107.1583513616855;
 Fri, 06 Mar 2020 08:53:36 -0800 (PST)
MIME-Version: 1.0
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
 <20200227041144.GA36493@zx2c4.com> <20200227142935.4ulyjoodgyeu4uoz@chatter.i7.local>
 <CAHmME9rkCgQwUnwUoOCzDzLi1biECs3ZwzApsPDKXykKPitZew@mail.gmail.com>
In-Reply-To: <CAHmME9rkCgQwUnwUoOCzDzLi1biECs3ZwzApsPDKXykKPitZew@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Mar 2020 17:53:24 +0100
Message-ID: <CAMuHMdVGD3GM8e29VM8brr8xiYFoL9uyY9ywMXfBpnZ5tCA1PQ@mail.gmail.com>
Subject: Re: Patch attestation RFC + proof of concept
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Feb 28, 2020 at 2:58 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> It doesn't help with the reverse scenario, where what's in the
> developer's inbox or displayed on the lore webserver running a
> backdoored nginx doesn't match the patches that they eventually apply.
> That might seem like an unrealistic attack scenario, but then think
> about it combined with the get-lore-mbox feature to grab the latest
> patchset version and other similar shenanigans. Or, maybe Eve reposts
> v1 as v20, and this mailing list thread convinces you to ignore the
> [PATCH vX] from the metadata hash, or maintainers don't care about
> that hash verifying anyway since it tends to get mangled.

Or different patches with the same subject.

Recently, I accidentally send out a patch with the wrong subject, which
matched an older patch.

"get-lore-mbox.py 20200218112557.5924-1-geert+renesas@glider.be"
downloads the new thread, plus the email with the old patch with the same
one-line summary.

Worse, "get-lore-mbox.py -a 20200218112557.5924-1-geert+renesas@glider.be"
selects the old patch instead of the new one, despite the exact Message-ID
match on the command line.  Fortunately "git am" complained, as the old
patch had already been applied.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
