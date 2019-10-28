Return-Path: <SRS0=MPmA=YV=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78343CA9EBC
	for <workflows@archiver.kernel.org>; Mon, 28 Oct 2019 10:03:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44E5020873
	for <workflows@archiver.kernel.org>; Mon, 28 Oct 2019 10:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572256995;
	bh=bRZAgVMaRIrTmnL5aNoEZhmCMd1FRHoAQh8qPzxWooU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-ID:From;
	b=Y0Xkg89C0Jzse1M4LvVb0iVnHJZnX0tJtjx2yXoIhDXTo+vJ0uqs7wPlMwk2PKH+7
	 7M+GqRFII99bfVQ93iqyEWnal6SY5s9M5KtnWITm19YmCRqTU0JQ8D70xgFAuM0y2q
	 tEF4sOuOdCIA6CbwLlsofCZJunJ0W0xMidgKfDrk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388143AbfJ1KDO (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 28 Oct 2019 06:03:14 -0400
Received: from mail-qt1-f179.google.com ([209.85.160.179]:37810 "EHLO
        mail-qt1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731876AbfJ1KDO (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 28 Oct 2019 06:03:14 -0400
Received: by mail-qt1-f179.google.com with SMTP id g50so13739007qtb.4
        for <workflows@vger.kernel.org>; Mon, 28 Oct 2019 03:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ey5m9PF0ehvLzm159tLzIBSp5hYtdFizhRq4G9/gz00=;
        b=H9HKD425HVchIcZLDcOvnWYqGoyyX+9oLmgvAEeXHLIG8hRHjXhxmWwUmzqOz0mhUL
         a6jkVj17Q9+hIsUieEpld705CMNurfqai3GEjjLorFg6+zy0e2KOoyHy0PtepE/wj3KL
         gGyEjVFqeoOt+qkDTTLaaYqR1kpXx/owlu5L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=ey5m9PF0ehvLzm159tLzIBSp5hYtdFizhRq4G9/gz00=;
        b=XTp1/DBqLiL+nvZxwR5Er+4n49Q58RQntGzBxMF0F+FBitETqgMgBAncU3IHJ5jBth
         gxg0VnV8FE6vLfu+v+JdSR/GTavmLAB/YTP9HYpyZHZdtvqzbzxUisV9htl0KxW5m5Xt
         P5TLEcSznuVbyX1++U9/EhmFR9Qx1Wi+Lq48dlzXdwXgTfrWXWrhRIzpwh/esff+wMYR
         tkHOFDa5yPIqu+CrnlaL3D9QWBFkx/yPceMzTU+z+6BS6zS6kjyeQhWaQtca2iaetaYv
         UpIc5Ki3iZnFNks51o3mNOZwxCdXeuZT1JIgiSIylBPcFS7tFAFYeBJF75np7as/weCF
         ZGXw==
X-Gm-Message-State: APjAAAV0PMNYTBrW0IeJGp4rafdjjJcDbCgXWBcSGLIpxa6gQz2+2iZ2
        UFiM8sIvR0GIqbWnX1cWvhbj2y6bC1CGN5mjQhJLQEr4+jPv5w==
X-Google-Smtp-Source: APXvYqwjiblehppimfPZehL0NGC2o+dsswc84cdpA/z2eGFPO3HUfig3DUgSapGrSrVcwUR7/BZAnbJ/nGO0qsNrCRI=
X-Received: by 2002:ac8:6782:: with SMTP id b2mr16455876qtp.184.1572256993026;
 Mon, 28 Oct 2019 03:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local> <CAMwyc-TRnJdiNcKiwK1cAUysGqQQLucPDHb_xRWf+-iCm2medw@mail.gmail.com>
In-Reply-To: <CAMwyc-TRnJdiNcKiwK1cAUysGqQQLucPDHb_xRWf+-iCm2medw@mail.gmail.com>
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date:   Mon, 28 Oct 2019 06:03:01 -0400
Message-ID: <CAMwyc-SJ2BmgWiicGNcCiL7Gq7VPB-+VjUF_KSSHA-jD8KMnZA@mail.gmail.com>
Subject: Re: Tooling and workflows meeting at OSS EU Lyon
To:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, 28 Oct 2019 at 05:25, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> OK, slight complication. It's a lot more people than expected:
>
> > - Steven Rostedt
> > - Greg Kroah-Hartman
> > - Dmitry Vyukov
> > - Konstantin Ryabitsev
> > - Christian Brauner
> > - Laurent Pinchart
> > - Jon Corbet
> > - Daniel Vetter
> > - Nicolas Belouin
> > - Shuah Khan
>
> - Nicolas Belouin
> + Daniel D=C3=ADaz
> + Rafael Wysocki
> + Han-Wen Nienhuys
> + Kevin Hilman

Okay we can make this work -- there are 3 round tables at the right
forward corner of the sponsor showcase room (to the very right of the
entrance doorways). It's quiet and next to the noise-cancelling walls,
so we should be able to meet and discuss there.

So:

Tooling and Workflows meeting, 14:00-15:00 in the Sponsor Showcase room.
Rough agenda:

14:00: introductions
14:05: Enhancing the email workflow:
    - cryptographic attestation of patches
    - adding (and requiring) base tree information in submitted patches
    - git-to-ML bridging
    - attestable bot, forge and developer activity feeds
14:30 Maintainer and developer tooling
    - can forges integrate with email workflows?
    - defining a minimal set of features useful for the maintainer
tool (kit/kthul)

The meeting will be unconference-style, so time overruns and agenda
usurpation is 100% expected.

I would love to brainstorm more about CI/bot integration, but I think
it makes sense to make it a separate discussion, perhaps with a
smaller subset of people. I believe if we manage to establish a
workflow around attestable public-inbox feeds, that will pave a
possible way for bot cross-integration.

I will be semi-permanently in the developer lounge area, so please
feel free to come and chat about any of these or other topics.

-K
