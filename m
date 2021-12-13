Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC15C433EF
	for <workflows@archiver.kernel.org>; Mon, 13 Dec 2021 18:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234465AbhLMSiK (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 13 Dec 2021 13:38:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238819AbhLMSiJ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 13 Dec 2021 13:38:09 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBE1C061574
        for <workflows@vger.kernel.org>; Mon, 13 Dec 2021 10:38:09 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id n9so11828877uaq.10
        for <workflows@vger.kernel.org>; Mon, 13 Dec 2021 10:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+dYugpz/ydnh4iasdbd+38vFJgf3DUiOyowzTdwY3zs=;
        b=fTyKUrwAbUyk7AVJi20VHh8sf1oldhi6n/ktgKqnR3Xf1hXXsW39IG8YkBWza9SDQ3
         hZfENFeP5V8z0h67GxKt8djsHIS6dhShTr0gsxdktOW5mYZ2Ndiai6a7xZ6fiwoUUrtk
         ZtBv0lMGJYJtN+ydJgkD8CHkvdXNj3OgKWJJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+dYugpz/ydnh4iasdbd+38vFJgf3DUiOyowzTdwY3zs=;
        b=lvRDpjp5/OygrfniQDz8NIS3GqaAAdO+upcYdYkdXhmAT9Eu5fROl477qTHn1JSDhk
         KdTS6iggjxIHlNahaS6sQbfQ8mO1lWTnk91he0q1fFYUuOKqeg65pouzojnEsc3wcobm
         EF+mfCpGxR3YyOggITdhgsWlVBv5yaLZiwz7pV6W+fiOKM3Ne7mx2psUAQg8oC89y+2e
         Lj4cO6CgAMm3iIXxNUmo5IxT8htSGsojJTn3XZzPwq83853yeDHOfAwQ1p+9UcUrxK7G
         YpLaceW+kP/mW+I+7QXsYH4MddJjmwoXfjettv4sohh0zM5rR8kV6qb0EGvr0UhOFQ5L
         bNXQ==
X-Gm-Message-State: AOAM53322pdEs4n2y6++qS1YUYCHE0XmOc4WuLR/2g+4k9oraO2QcxR9
        lmuTske4NO0vjDmvGuUrTHj4GgBSLVSJt0f5rAqj77uGOJMnPQ==
X-Google-Smtp-Source: ABdhPJwfCfcbDYvfO1khBPbFXw4qnB1xYBNrvpp30hXF7Gy1aha1l00spiLBuj/Rge6JJhGo4KWc0Sf799Ys8J37R00=
X-Received: by 2002:ab0:3301:: with SMTP id r1mr26014uao.96.1639420688078;
 Mon, 13 Dec 2021 10:38:08 -0800 (PST)
MIME-Version: 1.0
References: <87mtl7ufl3.fsf@toke.dk>
In-Reply-To: <87mtl7ufl3.fsf@toke.dk>
From:   Simon Glass <sjg@chromium.org>
Date:   Mon, 13 Dec 2021 11:37:57 -0700
Message-ID: <CAPnjgZ1THJQSUj2Mmq2P6EtJXZQV=th0vnN2cLZ=BZe_sck+SA@mail.gmail.com>
Subject: Re: Monitoring the status of your own patches on patchwork?
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi,

On Sat, 11 Dec 2021 at 12:06, Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat=
.com> wrote:
>
> Hi everyone!
>
> I was wondering if anyone had any nifty tricks or utilities to help
> monitor the status of your own patch submissions on a patchwork
> instance? Things like getting a notification when a patch changes status
> or when one of the automated checks on that particular patchwork
> instance fails for a patch you submitted?
>
> I can just filter the patchwork web interface to my name, of course, but
> I would like something that can be automated so I can make the stuff I
> care about show up in my inbox :)

I'll just mention 'patman status' here, which collects tags from
patchwork so you can send them with the next version. It also shows
you code-review snippets on the cmdline which I find much faster to
process, particularly for large patches. See below, although it's a
bit hard to read without the colours that patman uses.

I would like something that can track all the series and tell me what
is outstanding. At the moment I keep a manual list but often forget
things.

$ patman status
  1 efi: Rename UCLASS_EFI and IF_TYPE_EFI
  + Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
  2 efi: Add EFI uclass for media
  + Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
  3 efi: Add a media/block driver for EFI block device
  + Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
  4 efi: Locate all block devices in the app
  5 efi: serial: Support arrow keys
[...]
3 new responses available in patchwork (use -d to write them to a new branc=
h)

$ patman status -C
  1 efi: Rename UCLASS_EFI and IF_TYPE_EFI
  + Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Review: Heinrich Schuchardt <xypron.glpk@gmx.de>
    > File: include/dm/uclass-id.h
    > Line: 48 / 48: enum uclass_id {
    >    UCLASS_DMA, /* Direct Memory Access */
    >    UCLASS_DSA, /* Distributed (Ethernet) Switch Architecture */
    >    UCLASS_ECDSA, /* Elliptic curve cryptographic device */
    > - UCLASS_EFI, /* EFI managed devices */
    > + UCLASS_EFI_LOADER, /* Devices managed by EFI_LOADER */
    "managed by EFI_LOADER" does not catch it. I will change this to
    "devices created by UEFI applications and drivers" when merging.

  2 efi: Add EFI uclass for media
  + Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Review: Heinrich Schuchardt <xypron.glpk@gmx.de>
    > At present UCLASS_EFI is used to represent an EFI filesystem among ot=
her
    %s/UCLASS_EFI/UCLASS_EFI_LOADER/

    > pretty vague. The only driver that uses this uclass is in fact not a =
real
    > U-Boot driver, since its operations do not include a struct udevice.
    >
    > Rather than mess with this, create a new UCLASS_EFI_MEDIA uclass to h=
andle
    > EFI media such as disks. Make this the uclass to use for EFI media so=
 that
    The new uclass is for devices provided by an UEFI implementation loadin=
g
    U-Boot as an EFI application.

    > it can be used with 'part list', for example.
    >
    > The existing implementation using UCLASS_EFI remains as is, for
    %s/UCLASS_EFI/UCLASS_EFI_LOADER/
    The existing uclass is for devices created by UEFI applications loaded
    by U-Boot.

    > File: include/dm/uclass-id.h
    > Line: 49 / 49: enum uclass_id {
    > +++ b/include/dm/uclass-id.h
    >    UCLASS_DSA, /* Distributed (Ethernet) Switch Architecture */
    >    UCLASS_ECDSA, /* Elliptic curve cryptographic device */
    >    UCLASS_EFI_LOADER, /* Devices managed by EFI_LOADER */
    > + UCLASS_EFI_MEDIA, /* EFI media (e.g. a disk) */
    %s/EFI media (e.g. a disk)/devices provided by UEFI firmware */
    With those changes:

  3 efi: Add a media/block driver for EFI block device
  + Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Regards,
Simon
