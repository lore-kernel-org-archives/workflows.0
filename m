Return-Path: <SRS0=f2kX=4M=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124DDC11D32
	for <workflows@archiver.kernel.org>; Mon, 24 Feb 2020 17:39:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D53F520838
	for <workflows@archiver.kernel.org>; Mon, 24 Feb 2020 17:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582565981;
	bh=FhpFB1myZQQhL/zihwQqGGNXOUmY0mrJj/W/TX1lx18=;
	h=References:In-Reply-To:From:Date:Subject:To:List-ID:From;
	b=h0ZcyrWj2FhqhoA0zbno0Mzx3U0s+iXsydlxtq/jBeiOnh1zM39ayjUbWm5BAexin
	 DutP01XvAuv+WCweks3x/LAAaHpnnCyV+wJWjTfgO0wbHbiDp9KMR5x/YOathf8qWV
	 Jpf/pCG4ID2Bvl3iLOGlEzEGM5kHJCwgzBHdsxWA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgBXRjS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 24 Feb 2020 12:39:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:40090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727922AbgBXRjS (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 24 Feb 2020 12:39:18 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ABB3D20838
        for <workflows@vger.kernel.org>; Mon, 24 Feb 2020 17:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582565957;
        bh=FhpFB1myZQQhL/zihwQqGGNXOUmY0mrJj/W/TX1lx18=;
        h=References:In-Reply-To:From:Date:Subject:To:From;
        b=uafm9eZ6AiIzSWd2C+3+7/R/nCeNv4Cqeht7jKLbs/p1Ngo/j9KJK7Qe9/zVMjY5O
         BnZcrdpHEjiRcF2dKBYys59PhCgnQ14oYS36gpjQ1mS7/CrTbT1L8H+rzn0SkyTOKG
         nu04BeOy5n98B83VFt5DOp1c5+vdre4PFr2WrGYg=
Received: by mail-qt1-f176.google.com with SMTP id d5so7122672qto.0
        for <workflows@vger.kernel.org>; Mon, 24 Feb 2020 09:39:17 -0800 (PST)
X-Gm-Message-State: APjAAAVmtWBI2EV36vpwjSRXzzxDNbOhdmz/vwGgGwL7b9mYgyKQFMe+
        rCTFTj4cMid8WM1MqY4PvgPh57z00hy2lcV6vg==
X-Google-Smtp-Source: APXvYqzJ1c2u3E4OxP9jeNR6n7s1UTaNnEracOtOlAmNFzYkOC+5N9SQ7/LsH7BfBiBnBrtVOdEYnbQxNytX6nljbB0=
X-Received: by 2002:ac8:5513:: with SMTP id j19mr49107535qtq.143.1582565956828;
 Mon, 24 Feb 2020 09:39:16 -0800 (PST)
MIME-Version: 1.0
References: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
 <7hwo8p9db1.fsf@baylibre.com> <20200214195318.ghvcroucki4pcz4r@chatter.i7.local>
In-Reply-To: <20200214195318.ghvcroucki4pcz4r@chatter.i7.local>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 24 Feb 2020 11:39:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLEA=LYdB_21rWsA-LXO+f1ZPga4j6wn6bn5gFrhxFhhw@mail.gmail.com>
Message-ID: <CAL_JsqLEA=LYdB_21rWsA-LXO+f1ZPga4j6wn6bn5gFrhxFhhw@mail.gmail.com>
Subject: Re: get-lore-mbox: quickly grab full threads from lore
To:     Kevin Hilman <khilman@baylibre.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Feb 14, 2020 at 1:53 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Fri, Feb 14, 2020 at 11:30:42AM -0800, Kevin Hilman wrote:
> > Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:
> >
> > > I'd like your opinion on this quick helper script I wrote that uses any
> > > message-id to grab a full thread from lore.kernel.org and save it as a
> > > mbox file.
> >
> > This is very useful, thank you!
> >
> > One question/request: Is there a way for it to only grab a subset of a
> > series?  e.g. Some series contain patches that might end up going
> > through a couple different trees (e.g. DT patches typically take a
> > separate path than drivers) so as a maintainer for one of the
> > subsystems, I might want to only get a subset of the series into an
> > mbox, not the whole thing.
> >
> > IOW, Right now even if I pass a msgid from the middle of the series, it
> > finds the whole series (which is cool!), but what if I want to apply
> > just that single patch?  Or even better, I might want to only apply
> > patches 3-5 and 9 from a 10-patch series.
> >
> > Is this something do-able?
>
> I think for such cases it's easy enough to just edit the .mbx file to
> remove the patches you're not interested in. When you use the '-a' flag,
> the content is de-mimefied to remove various mta-transmission cruft like
> quoted-printable/base64 encodings, etc -- making it easy to identify and
> remove content that is not relevant.

It may be easy enough unless you have something like this series:

https://lore.kernel.org/lkml/cover.1582361737.git.mchehab+huawei@kernel.org/

It backtraces if you give it patch 2 msgid:

83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org

Presumably because patch 2 and and the cover letter aren't on the same
list? Arguably, that's bad practice, but it's quite common to only
have 1 or a few patches of the whole series. If you start with the
cover letter, then it can find everything.


Also, it didn't pick up 2 out of 3 Acked/Reviewed-by tags:

https://lore.kernel.org/linux-doc/CAHLCerP_UW-6CdaOziHTY01cD_6Ou4h0Jj6mOJKj60P4GL9H=w@mail.gmail.com/
https://lore.kernel.org/linux-doc/41551c09-5443-4980-9c6f-6bc7f48aa356@www.fastmail.com/

Rob
