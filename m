Return-Path: <SRS0=GKgx=4F=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9445DC35254
	for <workflows@archiver.kernel.org>; Mon, 17 Feb 2020 10:53:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6745B20725
	for <workflows@archiver.kernel.org>; Mon, 17 Feb 2020 10:53:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728425AbgBQKxJ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 17 Feb 2020 05:53:09 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:47017 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbgBQKxJ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 17 Feb 2020 05:53:09 -0500
Received: by mail-ot1-f51.google.com with SMTP id g64so15617283otb.13
        for <workflows@vger.kernel.org>; Mon, 17 Feb 2020 02:53:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v2Pk4jvoG9yWR9xGoyz6gMskRD35ZW+bb4LfcPvbVRQ=;
        b=Oe3La/gDF+akZgBIoyQ3Ns5D3vlvAy0HVkMR3ElGVALt4KJQ/kQCJ6BKwuCOW6Ki4Q
         od8Mcb3IPVJ+J7o9D0UQoOSQZAvNtjasjZgA+tGPBWO5hfLf5oEeNhOv6XGYm/p1DwES
         ZhNp0Gd4rPryDjufpzvOHJFES7JMMJx3yt1cO9haQCS0O0pJlHO/rGWGsnqQFl+zF6K2
         pSJqlunlwM9YrJ68wl6nLZNX2hpwaklWA9oQ3Lia7HbJ5gF3udr50KnCdrRaFO3SDulc
         5/dSw7zldAmtyskmZ02C8m0HvSTRVDzSIy+5wHpEdJ44Mg48TggP3WcESUE+mPok7STO
         72Aw==
X-Gm-Message-State: APjAAAWG7OUA3tfrUE3LNqto4iJpmd+19pGqoVnhQNq/swI+N1i7t7uv
        4ejYBaLPPsEnzygy9j8r9J24ysUvuEDez1iE/qXhuaqL
X-Google-Smtp-Source: APXvYqya90BTWIXOTOb92sL1WXMoGmtffxU9ZbOHCacqL1YNT0W36O70ZyiNCD3CWBUDmcIx0nQRxDmTASjJ/OsPmh8=
X-Received: by 2002:a05:6830:1d55:: with SMTP id p21mr11530472oth.145.1581936786136;
 Mon, 17 Feb 2020 02:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
 <7hwo8p9db1.fsf@baylibre.com> <20200214195318.ghvcroucki4pcz4r@chatter.i7.local>
 <7hftfcaow6.fsf@baylibre.com>
In-Reply-To: <7hftfcaow6.fsf@baylibre.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Feb 2020 11:52:55 +0100
Message-ID: <CAMuHMdU4B8JRnyuPmJ5jKryJj580OQnFYWXo8FXpwdFe7wnvxg@mail.gmail.com>
Subject: Re: get-lore-mbox: quickly grab full threads from lore
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Kevin Hilman <khilman@baylibre.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin,

On Fri, Feb 14, 2020 at 9:36 PM Kevin Hilman <khilman@baylibre.com> wrote:
> Anyways, this tool is really great and it's already replacing some of my
> homebrew scripts.

Indeed, thanks a lot!

BTW, I found another issue: 20200118124856.GA3421@nishad produces
a backtrace when using the "-a" option.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
