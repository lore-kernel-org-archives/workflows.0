Return-Path: <SRS0=vuSN=4P=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F6EC4BA24
	for <workflows@archiver.kernel.org>; Thu, 27 Feb 2020 10:05:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52D7824680
	for <workflows@archiver.kernel.org>; Thu, 27 Feb 2020 10:05:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgB0KFv (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 27 Feb 2020 05:05:51 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37771 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728630AbgB0KFv (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 27 Feb 2020 05:05:51 -0500
Received: by mail-ot1-f68.google.com with SMTP id b3so2381713otp.4
        for <workflows@vger.kernel.org>; Thu, 27 Feb 2020 02:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ty597OOrZk7xpM1jUxbuXi6V+tGQQF6lgfYENm8Da7c=;
        b=TjuL1frGRQs88NWaKRJK156DYcBO13qrySiC5UVUCBU+CGn8K3fQ/5ix6uAWeBdq68
         N4i5qpBoVHCvkvF2z3cJEX3Qy8SiOQReB+dK9uZafwJKtYFO7Ul+b/Djf+YwTR+WxXDL
         1L1TDHXVp1OOTa8saTjK6rERnSw12uMwbQpzONXhKuxtD/4cQzOVcROtELYVGpTF80b4
         N85V9LGIZm9uusTzqRQTa3wStDskQG6hdzeWk+X9qtDggAu4JAveJQDEKR9uy0wADPEg
         U/8470iQTyccpHnI6DV6lAq3+kjYsd8RdWcd53JMVgDTknp1k6zc6XK4vGmBKbecxq7M
         fmmw==
X-Gm-Message-State: APjAAAXH2evax5X7GvqxxIIeAgSItOERytKKWak93t6RkkyXsGPMGFnR
        9buhKrwdcwYUUVqf+26l2BS/au75QRoW3ppp3y1SGA==
X-Google-Smtp-Source: APXvYqwtt1WXsbXWLnZhabDSRzG6vSPMAoiMJmkFttYuUCbOYhABVxfORuiJIzCC6PQzWV5/zhrySfuvqh/KkUTQL1c=
X-Received: by 2002:a05:6830:10e:: with SMTP id i14mr2614970otp.39.1582797950030;
 Thu, 27 Feb 2020 02:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local> <20200227041144.GA36493@zx2c4.com>
In-Reply-To: <20200227041144.GA36493@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Feb 2020 11:05:38 +0100
Message-ID: <CAMuHMdXiVO8Lkg-qk1VQmp8opfoOXfurgkaqQcA5DdK78RBWow@mail.gmail.com>
Subject: Re: Patch attestation RFC + proof of concept
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     workflows@vger.kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Jason,

On Thu, Feb 27, 2020 at 5:13 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Another odd quirk worth considering: vanilla patches aren't tied to a
> specific commit base, so there could be a "replay attack" where an
> attacker resends an old patch that still applies without issue, but
> means a different thing in the present state of the tree. For example,
> Alice sends patch P in November 2019. Bob discovers it causes a remotely
> exploitable vulnerability in December 2019 and submits a revert patch.
> The seasons change a few times, and it's now March 2025, maintainers
> have changed a bit, but the code is still mostly the same. Eve resubmits
> P which has Alice's name on it. Signature verifies. Doom ensues. Real
> git pgp signing involves a signature over the whole object, which
> contains the hash of the parent, which avoids this issue.

How would the commit base help here?  It would indicate this is an old
patch, which would be indicated by the signature date, too.

The only thing that would help is time-limiting the window between
attestation and application.  So when applying an old patch, it has to
be attested again by the original author.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
