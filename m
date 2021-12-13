Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D02C433F5
	for <workflows@archiver.kernel.org>; Mon, 13 Dec 2021 23:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241338AbhLMXwD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 13 Dec 2021 18:52:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244279AbhLMXwC (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 13 Dec 2021 18:52:02 -0500
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067D9C061574
        for <workflows@vger.kernel.org>; Mon, 13 Dec 2021 15:52:02 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id w23so32068665uao.5
        for <workflows@vger.kernel.org>; Mon, 13 Dec 2021 15:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=flJBzazL3+cLiCg5Ip/am1MVEBhPoLMKKLPZwrcBteU=;
        b=Dq0qSwdcDM2lG18L1Qr1PJteJl+X62RuL2KojpNyD3ull7Y9DLsWx7awa5S80bMknZ
         pK73eZC17OJmdDnZJgu6EH7/nHl+JI5dqcoiAppefC+u8RjNrcESE81ZwK88SlW7bs8P
         tXyCGuvYyxdr1lZpWTlH7bFwUE+FvuuCkKkQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=flJBzazL3+cLiCg5Ip/am1MVEBhPoLMKKLPZwrcBteU=;
        b=jIpvQwZ3KuQSVpj65ETNSkz7Pfsewqz0SWEGhTZSKfKLr6G6Da8UiCsyjUzrxZSu0M
         hBvSlkXHvOk4N32TI/NjBVFwY4N12F9XJ8ygPqPnuETxfciwI6JFVmxOE+IWruYVTZZs
         z/SbiTOvQHcTp15hjHrkN8Tntdv9LIfIf990ntx6GSIRChXIvIc+4A/dNpGdHkxQjbcI
         HpgdnUZZW3nLO9hBclqyf3hUfkCUg8h1y2VNRMiCe/kbFp21prQYRej+bP/oCiAhTtxx
         RC/KFmcGTr7Q4vgpwGaiksA4zRhTX80vXA4ing4XsyKnrvWgEoZENE8H/+RbsKGtNLeJ
         Grag==
X-Gm-Message-State: AOAM5316V3BF5pWCJNJU6dILsnMd+Pe4ut9nvNfBBMmMvberxwLWa5Hr
        ffSYK7x3AO+1DHN3Q0lKuo2xgxEmPa2h4zpYMOJrsxgUuwE=
X-Google-Smtp-Source: ABdhPJxLitdmRAB7oQzz3hH5OxVO+PUR/51VCkDTLoce5ZZuh6M7EQjJHgGOxcBzjeawLpxR5Fx/FsR90wkjwJ8SvOA=
X-Received: by 2002:a05:6102:c4e:: with SMTP id y14mr2337649vss.61.1639439520718;
 Mon, 13 Dec 2021 15:52:00 -0800 (PST)
MIME-Version: 1.0
References: <87mtl7ufl3.fsf@toke.dk> <CAPnjgZ1THJQSUj2Mmq2P6EtJXZQV=th0vnN2cLZ=BZe_sck+SA@mail.gmail.com>
 <87r1agyydd.fsf@toke.dk>
In-Reply-To: <87r1agyydd.fsf@toke.dk>
From:   Simon Glass <sjg@chromium.org>
Date:   Mon, 13 Dec 2021 16:51:49 -0700
Message-ID: <CAPnjgZ2isPpP7owq6DTBQRzk347L6gg1fxbpM1gqAymT+6XKbA@mail.gmail.com>
Subject: Re: Monitoring the status of your own patches on patchwork?
To:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Toke,

On Mon, 13 Dec 2021 at 14:43, Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat=
.com> wrote:
>
> Simon Glass <sjg@chromium.org> writes:
>
> > Hi,
> >
> > On Sat, 11 Dec 2021 at 12:06, Toke H=C3=B8iland-J=C3=B8rgensen <toke@re=
dhat.com> wrote:
> >>
> >> Hi everyone!
> >>
> >> I was wondering if anyone had any nifty tricks or utilities to help
> >> monitor the status of your own patch submissions on a patchwork
> >> instance? Things like getting a notification when a patch changes stat=
us
> >> or when one of the automated checks on that particular patchwork
> >> instance fails for a patch you submitted?
> >>
> >> I can just filter the patchwork web interface to my name, of course, b=
ut
> >> I would like something that can be automated so I can make the stuff I
> >> care about show up in my inbox :)
> >
> > I'll just mention 'patman status' here, which collects tags from
> > patchwork so you can send them with the next version. It also shows
> > you code-review snippets on the cmdline which I find much faster to
> > process, particularly for large patches. See below, although it's a
> > bit hard to read without the colours that patman uses.
>
> Ah, this is cool, didn't know about patman! Will take a closer look, it
> seems to be solving some of the same issues I've been rolling my own
> solutions for - thanks for the pointer! :)

You're welcome. I do hope things continue to grow in this area.

Regards,
Simon
