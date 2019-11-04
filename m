Return-Path: <SRS0=lUaU=Y4=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C85CA9EA0
	for <workflows@archiver.kernel.org>; Mon,  4 Nov 2019 11:26:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BE12217F4
	for <workflows@archiver.kernel.org>; Mon,  4 Nov 2019 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572866802;
	bh=j4nil2Nv8vQSfjMbtWhttcNkLwqKssq3IIE+69Hir8A=;
	h=Date:From:To:Subject:References:In-Reply-To:List-ID:From;
	b=O8kIDfDuQmhMl0Y6hhrlWOxnzpXVxC0A0p6Dy4zWD8viE7bA27yEQEsyGRIdEGWW8
	 QZNtLKhFrcTcrs201xA0vHCOdYFmtfoGYNkgqFUCGaJaSRNJkF8PMzt1HXoIedsMTb
	 OY+7H9wCY5dUeB96LzzVgwL34VRrML+X7RIWiNQs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfKDL0m (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 4 Nov 2019 06:26:42 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52482 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbfKDL0m (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 4 Nov 2019 06:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=J24oLBcOM7uNZyBKkwPrKg0+QhLci0eZJKcGVR/WwRo=; b=BRQLlKD8CbeYXMMshehyr2KjP
        38vnKb1PzmmCfXcbMeNP0o0aPkdraDyTegDhtmWe8phOuvUpG8nGxqlO6Rm+1k2L3bpJeq98UhRmW
        3sZCg27ilPcgxOHzYh5PS6b2Y+Tor2kPQer1jPdh+8G1eoVp3pIdtNZpNU5Xt7jJcvZlc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iRaVL-0002PV-U0; Mon, 04 Nov 2019 11:26:40 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id C0BD3274301E; Mon,  4 Nov 2019 11:26:38 +0000 (GMT)
Date:   Mon, 4 Nov 2019 11:26:38 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Eric Wong <e@80x24.org>, workflows@vger.kernel.org
Subject: Re: patch attachments still unwelcome?
Message-ID: <20191104112638.GA5238@sirena.co.uk>
References: <20191101022746.GA25491@dcvr>
 <20191101130012.yxtbzz4olyr2hh3f@pure.paranoia.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <20191101130012.yxtbzz4olyr2hh3f@pure.paranoia.local>
X-Cookie: This page intentionally left blank.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 01, 2019 at 09:00:12AM -0400, Konstantin Ryabitsev wrote:
> On Fri, Nov 01, 2019 at 02:27:46AM +0000, Eric Wong wrote:

> > patch attachments seems hypocritical.  Changing the kernel docs
> > allow patch attachments could be a good start to making life
> > easier for contributors without SMTP or IMAP access.

> > Are many MUAs still incapable of handling them?

> It's not really that they are incapable of "handling" them, it's that
> patches-as-attachments make it significantly harder to do code review in
> a way that is convenient to developers. While some MUAs will properly
> inline-quote an attached text/plain file when you hit "Reply All",
> many others won't, requiring manual copy-pasting in order to comment on
> actual patch contents.

It's not just the recieving end either - persuading some MTAs to encode
things as text can be a challenge.

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3ACsUACgkQJNaLcl1U
h9DsPAf/d74kOQPSOEWMWhjSa8NMuLwhhBjpGI3k7XMV05piZ9aXlHIRoTz5gNI1
gQH/fTMYX/m4lOCLJAhylR8QgOkpBFeL9atD3udlZAOjMS9JvLB1SQG1wPjsN/Qg
W+jfeVZTRQKn/GrF8vGYyNEOamYesNTVIW7xA6TRCErehkMFNPLEaSnD1yzRpmXr
HTJne5w0hpiamIrr1Ft4w5qDiB0dI8wjeby0znB76xLLXO2bYlsF8tc9kduuLRb9
ATRj/lsq2a31204TtPKk4tDHO9VavH9rEhcDbGms4ZaeZdILS3/kYTjtZVB2CrO6
Ym/ca1XrAl88N2AIIZK1TsjBxPkV/A==
=Wd3e
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
