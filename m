Return-Path: <SRS0=NMkj=YZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0E3CA9ECF
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 20:46:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15A9A218DE
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 20:46:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbfKAUqg convert rfc822-to-8bit (ORCPT
        <rfc822;workflows@archiver.kernel.org>);
        Fri, 1 Nov 2019 16:46:36 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45651 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfKAUqg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 1 Nov 2019 16:46:36 -0400
Received: by mail-oi1-f196.google.com with SMTP id k2so9253989oij.12
        for <workflows@vger.kernel.org>; Fri, 01 Nov 2019 13:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6A7hGV62HIGhYJAVhARySnLCrX96tqSKy0kvkvr9iOQ=;
        b=ER5FiolJIdvMoeTrGCQgD6Wb2Rko01o/qTRbCix1UQjxf98VErGM8mLDqMxrVrWN9v
         9P0aHBQeezF3ngJa9q6dWsDg75S/bc3NQrv/N4HX/L6apDICRbR1l3FD7uG51aNfUpZI
         IHAWwXo3rlBW/zAFxk2WF9f/CDYbZwR/9ogxFqEGrnEz54aW5Gp7JBBANvYA94XaWvdW
         Zid5H9h6NZlkRCN6qiphoLNEcUlurGHXB9YodnrusrzCPNMcZVO8vCLCJCX/uya/7+fy
         /EbYQkWO2VFG3zaV+09S4DxfnYBuJx+jlBVKtwhIZUzOSICpqad4QLheb8UmTJuOtFCf
         Te3A==
X-Gm-Message-State: APjAAAVl4VPERd2lBWS2jRCqGQVjVinyLTMADtLvQtwquauFDY8FinlI
        fgiCDgs7QG5mbztL2f/bzmhVIsZKvWVqOrj4QJ6Ztg==
X-Google-Smtp-Source: APXvYqxzI/8JoZtARWj5bOwcRrVgB7oM7rlGW91r5FH88TvEDas4Yms+TBvXLappxTS9ITo7AuN9zpmdATE/vX8HpiQ=
X-Received: by 2002:a05:6808:60a:: with SMTP id y10mr3699775oih.102.1572641195573;
 Fri, 01 Nov 2019 13:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191029222629.GA19318@dcvr> <20191029231313.GA124865@google.com> <20191101200755.h7gyt63rgwyxuqbd@pure.paranoia.local>
In-Reply-To: <20191101200755.h7gyt63rgwyxuqbd@pure.paranoia.local>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Nov 2019 21:46:24 +0100
Message-ID: <CAMuHMdV0M4YrexhYdEH2wRkhB6gyTtMXigA4QfMjYO3BCysZUg@mail.gmail.com>
Subject: Re: Lyon meeting notes
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Bjorn Helgaas <helgaas@kernel.org>, Eric Wong <e@80x24.org>,
        Han-Wen Nienhuys <hanwen@google.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin,

On Fri, Nov 1, 2019 at 9:10 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Tue, Oct 29, 2019 at 06:13:13PM -0500, Bjorn Helgaas wrote:
> > On Tue, Oct 29, 2019 at 10:26:29PM +0000, Eric Wong wrote:
> > * Linus checks sigs, but subsystem maintainers don’t.
>
> Rather, they can't, because there is no accepted or workable mechanism
> for doing so.

That depends.  The pull requests I send to subsystem maintainers use
signed tags, just like the ones I send to Linus.

The difference lies in the transport medium: Linus receives most commits
through (signed) pull requests, while most (leaf) maintainers receive
(non-signed) emailed patches.

> > * Identity tracking? PGP giving up on key signing. TOFU.

I guess TOFU is good enough for patch submissions.
Does it really matter who I am? Yeah, the DCO says I must use my real name.
But would people stop trusting my patches if I suddenly announced my name
is not (and has never been) Geert Uytterhoeven?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
