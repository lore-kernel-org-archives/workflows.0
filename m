Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CF7C4CECE
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 10:42:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B833520854
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 10:42:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JqlhjNU4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731449AbfJNKmn (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 06:42:43 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39341 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731249AbfJNKmn (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 06:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571049761;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VXlqXnCJIQtb+eKq9RJoPWH5J3Go721RmgCaTY3D0EE=;
        b=JqlhjNU4um56vURBnTMSz3y9Iq4ip5QddyajvKvQS+chlGnPyVhdmCA1Xb2p/Iu3ix882x
        nbxdrQzxlzFrSyLyr6qjZH05QmKeIeX7/s7GksnS8XTPmPjofgmEfJB5KUqgNwVcYr2I5T
        LFmk4nhQS7Ns/0z8f94Y6WCBJBroCEg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-ukIzeyDgPQyAIWJDSVoVPA-1; Mon, 14 Oct 2019 06:42:40 -0400
Received: by mail-lj1-f197.google.com with SMTP id x13so3248306ljj.18
        for <workflows@vger.kernel.org>; Mon, 14 Oct 2019 03:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=C7qtr6T4MVBJYRhTwdleesiLOkqZmw91WMsMUA40muU=;
        b=JL5DbvA7ilxYAHA5C7speVNzFuWJ17Dm9NlAYXs1n0D9/IwPvL5qUtVVYH1au3NefT
         7TE5u0dYWFP4u/Kb21Sb1petPVLcktyCwu3pqQL7KaMl16RmFXZbsRO6+kGDvOA79oDi
         Av7OW4My32C1jNiYvkQTcalDg9aC24O32tjHs4lRWkEK5qMOJ2lX+WdGeaMmr4ze3PU8
         TN93IDDX3HaPVfshUMz8s4RXJkmeimQQ4XsPdJjneTmBSt/PUa8NtJBt+3qii5B30a0U
         bCLXDcT/s/gZ4jDdiFKtkh2c1kM0aAu3F6IIqIvol8AfxZecUgUXqdAzZRfwtbguyOBX
         f1Sw==
X-Gm-Message-State: APjAAAW8GF0ju9QeSunBeCTPw171d7hWU4T9Py/GWpV2PzbNT7Op7UNW
        YH8UJCmdd72UgEVgRzmvW1aT0IhHshnPxNd56Z785HcuV0iQNQFLROA1KoRmeRc+jUbEfxTYuPa
        bf/dKdoj511uZmY6Zh8/V
X-Received: by 2002:a19:a402:: with SMTP id q2mr17057941lfc.128.1571049758370;
        Mon, 14 Oct 2019 03:42:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwOUMBGUoxfOlrnErQxfVq6GBbZenfLo5wSDrJpp4LKpVOxRzgfaiHYls7ubsztKtKMrWFHZQ==
X-Received: by 2002:a19:a402:: with SMTP id q2mr17057922lfc.128.1571049758169;
        Mon, 14 Oct 2019 03:42:38 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a00:7660:6da:443::2])
        by smtp.gmail.com with ESMTPSA id j28sm4070196lfh.57.2019.10.14.03.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 03:42:37 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 5900618063D; Mon, 14 Oct 2019 12:42:36 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Daniel Axtens <dja@axtens.net>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Dave Airlie <airlied@gmail.com>,
        David Miller <davem@davemloft.net>, mchehab@kernel.org,
        skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
In-Reply-To: <87lftotdv8.fsf@dja-thinkpad.axtens.net>
References: <20191011140108.589bbb52@gandalf.local.home> <20191011.113254.1964556815296845399.davem@davemloft.net> <20191011155949.145f0f7d@coco.lan> <20191011.121153.1410013220730418292.davem@davemloft.net> <20191011141909.1ccb58b3@hermes.lan> <20191011174719.16e997f5@gandalf.local.home> <CAPM=9tyjGBC2e5mi7=OetWACYjQ6iwiLPNXpuAEReeyttKNrtw@mail.gmail.com> <20191011190009.6ee15756@gandalf.local.home> <20191011170839.75c52ad3@hermes.lan> <87lftotdv8.fsf@dja-thinkpad.axtens.net>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 14 Oct 2019 12:42:36 +0200
Message-ID: <874l0bk3qb.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: ukIzeyDgPQyAIWJDSVoVPA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Daniel Axtens <dja@axtens.net> writes:

>> It does bring up that any new workflow has to have security protocol
>> and threat model as part of its design.
>
> This is actually something that worries me about the patchwork
> workflow. Maintainers seem to trust the patchwork version of a patch
> without much (or any) verification that it matches what was sent to the
> list.
>
> Say Alice emails a patch that says something like:
>
>  if ((permissions =3D=3D allowed) && other_stuff) {
>     do_things();
>  }
>  do_more_stuff(permissions);
>
> List members read that email, and many review it in the email client.
>
> However, say that the version in Patchwork actually reads like this:
>
>  if ((permission =3D allowed) && other_stuff) {
>     do_things();
>  }
>  do_more_stuff(permissions);
>
> (You could get this with a malicious/compromised patchwork admin, or a
> sufficiently advanced network adversary - patchwork takes the first mail
> for a given message-id + project and later ones are discarded, so
> there's a race you can win.)
>
> If the maintainer or someone else happens to apply the patch from
> patchwork and then review it, or if tests happen to catch the relevant
> case, we'll catch this. Otherwise...
>
> It's not the easiest or lowest risk way to get malicious code into the
> kernel, but nonetheless, I worry about it.
>
> I can't think of a sensible way to fix this, unless we want to move to a
> world where patch submissions are GPG signed, and teach patchwork to
> verify sigs.

It should be detectable, though, right?

Say you have two independently administered patchwork instances (or even
better, two different software packages entirely) that both subscribe to
the mailing lists, and compare patch content with each other. They
should at least be able to detect mismatches. Especially if you add a
sanity check before discarding duplicate message-ids.

This way you'd need to compromise multiple machines to achieve the kind
of compromise you're worried about. And you can add more independent
machines until you're satisfied that the risk is low enough :)

-Toke

