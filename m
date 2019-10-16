Return-Path: <SRS0=qIWo=YJ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07ADFA372A
	for <workflows@archiver.kernel.org>; Wed, 16 Oct 2019 19:09:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7233218DE
	for <workflows@archiver.kernel.org>; Wed, 16 Oct 2019 19:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571252993;
	bh=PwDGsbHvUm9PucQ3fR8KKcrc/0tWUJCIb3E/VB50d7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=danOyydR6jvoraE/hESZFOTC8h25b3FCCLDdsFRTNTQmGdlq8cAJVY0eajj+E3qu+
	 0ReSYcyvSt43wBECalQRqSd5tDROdq41+tOUP3GMHRPwg5Kor0Ra3GbF3V2mJ5vYAr
	 JGbrCvl9e3VoVp1BRDG9XkC4Br7xyv1exJ/MD8vg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403747AbfJPTJx (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Oct 2019 15:09:53 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:53788 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732084AbfJPTJx (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Oct 2019 15:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=SX/YEr6v0qU70S2BPQWl4oZb1aQen0uSpnVkPF5EoLs=; b=A6zBoROAKJBFC1AmH8iRtftQl
        3eUDgeTmUKez3VwjTrB0mK9/E0huZeAuA64/wj6cZyCrDuCdXbxQ79o7z6P81xUclIKJ68ZO9NzZi
        0XSxIHaBrbOrez8Du8B2W/mE0jeLtUhwp84KIqrH58sx/Oa9mK3XjeVe4uUbtFzf7YHPA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iKofF-00064v-Bf; Wed, 16 Oct 2019 19:08:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 83A412741FCE; Wed, 16 Oct 2019 20:08:52 +0100 (BST)
Date:   Wed, 16 Oct 2019 20:08:52 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Han-Wen Nienhuys <hanwen@google.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191016190852.GG4881@sirena.co.uk>
References: <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu>
 <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015015425.GA26853@mit.edu>
 <CAKMK7uGtvqFSw+wOBeGjV88DeyUoMTV3+F4Fpqv6NGUBCkAAgA@mail.gmail.com>
 <CAFQ2z_Pxc=0LjEieUC7Dz_sQiUKBr2oKUVrW7Fppj5AQbD_W5A@mail.gmail.com>
 <CAKMK7uGseMAmmLkawkaMMJgK=XAXoK+vOP8Uo9obXpss_v+WYQ@mail.gmail.com>
 <CAFQ2z_OVwS0Ups1QCEvJBFTsZmsw1u25bJh+a3xArjhXggLqcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f5QefDQHtn8hx44O"
Content-Disposition: inline
In-Reply-To: <CAFQ2z_OVwS0Ups1QCEvJBFTsZmsw1u25bJh+a3xArjhXggLqcA@mail.gmail.com>
X-Cookie: Serenity through viciousness.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--f5QefDQHtn8hx44O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2019 at 08:56:53PM +0200, Han-Wen Nienhuys wrote:

> With the email workflow, isn't it hard to keep track of which patch
> went into which tree? Something that tracks the identity of commit
> (like Change-Id) as it travels across trees could help here.

Once something's in git it flows into other trees via merges so the
commit ID is stable, the exception is backports where the ID from
mainline gets referenced in the backport.  Normal development doesn't
use cherry picks really.

--f5QefDQHtn8hx44O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2nasMACgkQJNaLcl1U
h9A+sAf/XrlBB9yDPqW88PPQpPIzmnktcP2qaIMS1Ll4OBw1VwGLNrfllL9dRBL1
iti4ZKFSqzj4O3Aq25oHA7kuRsCo+f0uGg7HuXcPKTX1pjLd0m+CLO5mg7V+6mlo
ilfTBm8Gte/NrRY8DfjSugTMYOuC83kNJWEQs2dDRhqEX7ne14yon0WrQ7JQGraD
I+yVYYCktvnR+KQpqWchmdvzbS1GSt5pkkV5Zi34lTL8LUf06TkgGCKxBYPFjuxA
CA1Og+Md4OLKzVIt7c+hxeQ7mKKCWGAixaZWel/D+AsyNVxIzOx7tUH/oV+TlOCX
hu1C1/YdMLpQ+ZChNMbKsIymbXVd+g==
=mnSZ
-----END PGP SIGNATURE-----

--f5QefDQHtn8hx44O--
