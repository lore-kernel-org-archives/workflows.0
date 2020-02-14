Return-Path: <SRS0=XKJj=4C=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EA6C35242
	for <workflows@archiver.kernel.org>; Fri, 14 Feb 2020 19:53:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8226C206D7
	for <workflows@archiver.kernel.org>; Fri, 14 Feb 2020 19:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581710027;
	bh=QydehZYP9oFYaeqFHkw/6Ilr7L5KHpi3S0TtV5uLrAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nwFc79n2otyAFbEOn7RQbrdImQXUFyrWXABdNd8C+NkHgGad0968Pc2wWlISUGfEa
	 PvX6lZxAuOHTd5kW6D9ZDn5HZ9bN2ToPuXetSLHZ+Tee8yiZcivI6kjwtjDuFAfY/L
	 V1V5HskNHCJWrV2Fq+iwT3QbN9tJtCIi812sxusc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387964AbgBNTxr (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 14 Feb 2020 14:53:47 -0500
Received: from foss.arm.com ([217.140.110.172]:44430 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387401AbgBNTxr (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 14 Feb 2020 14:53:47 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8472D30E;
        Fri, 14 Feb 2020 11:53:46 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05D6B3F68F;
        Fri, 14 Feb 2020 11:53:45 -0800 (PST)
Date:   Fri, 14 Feb 2020 19:53:44 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Subject: Re: get-lore-mbox: quickly grab full threads from lore
Message-ID: <20200214195344.GQ4827@sirena.org.uk>
References: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
 <7hwo8p9db1.fsf@baylibre.com>
 <87zhdlares.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lG9v85r552aFjg4G"
Content-Disposition: inline
In-Reply-To: <87zhdlares.fsf@toke.dk>
X-Cookie: Shipping not included.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--lG9v85r552aFjg4G
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2020 at 08:40:43PM +0100, Toke H=F8iland-J=F8rgensen wrote:
> Kevin Hilman <khilman@baylibre.com> writes:

> > IOW, Right now even if I pass a msgid from the middle of the series, it
> > finds the whole series (which is cool!), but what if I want to apply
> > just that single patch?  Or even better, I might want to only apply
> > patches 3-5 and 9 from a 10-patch series.

> > Is this something do-able?

> git am --interactive ?

That's not so great if your patch application is done as part of a
script (eg, with something like aiaiai) rather than interactively.  You
can always download the full mailbox, open it and delete unwanted
messages but it'd be handy to be able to do that as part of the download
stage.

--lG9v85r552aFjg4G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5G+scACgkQJNaLcl1U
h9Bd7Af/YfDty3EPe8HJe2tCDytP8BNN7UJu6RvBcjnVDYFUw9dbi42+uO54gfhp
h44uYIs7lp5GzZLRCmLsjO6kG9W2axFovQ/++LWK4rqydkoPvUESa6HyosE9YIu9
6XeKAYhZ2J8o4nEGJVANjTvuS7wZ/ZB5CNj1gSK7+QEUR60+09AD0wtpL8v44z7E
gazVwlEuam6kPqa5yjUNAtC0ahLU/VRgqWtlIr7Nk0ucjUEdQtMNNO7CVJAQfluj
6NJsZXgDBNeKOUag9s3qBttmGFeFFHe+xhISEmmOv1qVkPPmLS5rE7/FYcQ+jaCw
ukrygA+YIzTgWO+dBdcYwzdKlOm80Q==
=Gj/p
-----END PGP SIGNATURE-----

--lG9v85r552aFjg4G--
