Return-Path: <SRS0=qLuY=YS=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A19CA9EA0
	for <workflows@archiver.kernel.org>; Fri, 25 Oct 2019 06:58:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD35020867
	for <workflows@archiver.kernel.org>; Fri, 25 Oct 2019 06:58:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gandi.net header.i=@gandi.net header.b="Fn02I5aj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405704AbfJYG61 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 25 Oct 2019 02:58:27 -0400
Received: from mail12.gandi.net ([217.70.182.73]:36215 "EHLO gandi.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727595AbfJYG61 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 25 Oct 2019 02:58:27 -0400
Received: from localhost (2a01cb000fa77300fbcc620f3e2cda12.ipv6.abo.wanadoo.fr [IPv6:2a01:cb00:fa7:7300:fbcc:620f:3e2c:da12])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by gandi.net (Postfix) with ESMTPSA id 99C0B1605DD;
        Fri, 25 Oct 2019 06:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gandi.net; s=20190808;
        t=1571986704;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=84RaUIYmxjcATt/7clAdDpj4mJhENmYB2C1tnFJmqs8=;
        b=Fn02I5ajhv1Nvf8ZexGcyOoLcNgnXS4ERNSEnS/HpZ74QNMn42zoJxr5sp0/oa0EkIR+sP
        kz/H3t/qXsWkT0rVwVvrjbFJcMSeBEd+6RaeHCG+uMSQFGyj2x7qF7co79rBzuYCMGLRN+
        U1SYl4RoJKyIXKsXAJFLiUMY3G9Koa6yolz8OYM3i7FAoVeNN2JmIbtpSDf3MOE1r1Oi4G
        dvYKa8wxjRo3IGcVvos5UpO1qx9SEERjdeUs4cR+Y3JIGoHaDFdXwTHrSb2v0bMRJY5r2e
        hTEaAQ3+FLaU3zOhhfbYy1LJSdElx8F2hf7TyZNOK/1+DtfVYuC/Xyy1gWse5A==
Date:   Fri, 25 Oct 2019 08:58:22 +0200
From:   Nicolas Belouin <nicolas.belouin@gandi.net>
Subject: Re: Tooling and workflows meeting at OSS EU Lyon
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
References: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
In-Reply-To: <<20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1571984048.r9usf2hav0.astroid@diconico07.dev.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Excerpts from Konstantin Ryabitsev's message of October 24, 2019 10:58 pm:
> Hi, everyone:
>=20
> So, if I read everything correctly, the meeting shall take place at OSS E=
U
> Lyon, on Tuesday, from 14:00 to 15:00. The following people have=20
> expressed interest in attending:
>=20
> - Steven Rostedt
> - Greg Kroah-Hartman
> - Dmitry Vyukov
> - Konstantin Ryabitsev
> - Christian Brauner
> - Laurent Pinchart
> - Jon Corbet
> - Daniel Vetter
> - Nicolas Belouin
> - Shuah Khan
>=20
> (If your name is not on this list but you're planning to attend, please=20
> follow up.)
Unfortunately, I won't be able to travel to Lyon (an ankle strain got in=20
the way).
>=20
> I have confirmed that we can use the Developer Lounge, which will=20
> contain either a whiteboard or a flip chart. Alternatively, if you think=20
> we should get a dedicated meeting room, we can book one on-site. It's on=20
> a first-come, first-served basis and it doesn't look like I can book it=20
> before actually getting there. I will send exact details of the location=20
> on Monday.
>=20
> Since we only have an hour, I propose that we focus on a couple of=20
> topics and perhaps keep them anchored to the immediate future,=20
> discussing evolutionary changes as opposed to grand schemes that will=20
> require changing half the known world.
>=20
> I can discuss any of the following topics at length:
>=20
> 1. Current tools and automation offered at kernel.org, plus new features=20
>    they are likely to see in the future that are interesting to both=20
>    developers and maintainers:
> =C2=A0 =C2=A0 - public-inbox
> =C2=A0 =C2=A0 - patchwork
> =C2=A0 =C2=A0 - bugzilla
> =C2=A0 =C2=A0 - pr-tracker-bot and git-patchwork-bot
>=20
> 2. Proposed enhancements to the email-based workflow
> =C2=A0 =C2=A0 - cryptographic attestation of patches
> =C2=A0 =C2=A0 - adding (and requiring) base tree information in submitted=
 patches/series
>     - git-to-ML bridges ("turn this pull request into a well-formatted=20
>       patch series and send it to the right places")
This point should be addressed during the meeting as it will define some=20
goals for the whole process
>=20
> 3. CI and bot integration
>     - identifying the data that maintainers/developers want to see
> =C2=A0 =C2=A0 - communicating structured data over email
>     - providing consumable feeds of CI/bot jobs (as public-inbox=20
>       repositories?)
>     - avoiding bug duplication
>     - recognizing when a bug is fixed and following up on issues that=20
>       nobody has taken on
This point is from my point of view the one that should be prioritized=20
as it will directly benefit to maintainers, developpers as well as=20
users.
>=20
> 4. Maintainer tooling
>     - adaptability of existing tools for kernel development, such as:
>       - GitHub/GitLab
>       - SourceHut
>       - Gerrit
>=20
>     - building on top of public-inbox feeds to create a tool that can:
>       - track patches obtained from multiple sources (multiple mailing=20
>         lists, individual developer feeds, bot activity feeds, etc)
>       - collect the usual trailers (Reviewed-By's, etc)
>       - show interdiffs
>       - send automated templated replies
>       - apply series to a local git repository (streamlining "save these=20
>         patches as an mbox, make a new branch, run git-am")
>=20
> Unfortunately, that's enough topics to fill a 3-day mini-summit. :)=20
> Which ones are folks most interested in discussing during the meet-up,=20
> and which ones should be targeted for hallway discussions?
>=20
> Regards,
> --=20
> Konstantin Ryabitsev
> Director, IT Core Projects
> The Linux Foundation
> Montr=C3=A9al, Qu=C3=A9bec
>=20

Regards,

Nicolas
