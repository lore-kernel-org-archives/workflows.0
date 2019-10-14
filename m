Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1F6C4CECE
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 11:31:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86526207FF
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571052690;
	bh=kKVQyZ5u2pdHVK0UNditGl3eCeII4jHNkqeJOqZ0/8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RzI2dUVCcQwISMhAnTTmmo1yBIVaY/JX6tRywjdGHruJaEKEDIU03WyudEdXMmhuR
	 CYJLtexwPsYvjek3cYi+Ue+0a4NL8ZaH3+HGVAB2O/UG8YEyaVcLdpIkrx7KdZqjIi
	 gIvx1sjDErt36JBF5CTZMj+Yn2dRA7v8ak3gFnVw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729999AbfJNLba (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 07:31:30 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:34174 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729930AbfJNLba (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 07:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=od7uK9MSZ0ptZ1g2eBKfMy/a1yjaw54zbsZrX/lj1zU=; b=jROWxcJZood3dopRAqZSuyBg1
        EbbYM5bT/i8ZK2scELlyNa7Q3+MH07FsiB2HUlFjxNE4cv9gEpm5ff9gnMzJdnHqtUaMYFcMwcDug
        EyJoWa+V09aZ5wAjJCnUeBc6ZvO2wtqZEXWVW4iMOpgFam9CEmmX5vCfPpKMYRtOiEdMk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iJyZQ-0007T9-Oz; Mon, 14 Oct 2019 11:31:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id CDB042741EED; Mon, 14 Oct 2019 12:31:23 +0100 (BST)
Date:   Mon, 14 Oct 2019 12:31:23 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Eric Wong <e@80x24.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191014113123.GA4826@sirena.co.uk>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
 <20191011212308.xk7xcvfamwnkwovn@dcvr>
 <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
 <20191012071911.GA2034802@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <20191012071911.GA2034802@kroah.com>
X-Cookie: Androphobia:
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 12, 2019 at 09:19:11AM +0200, Greg KH wrote:
> On Fri, Oct 11, 2019 at 05:35:53PM -0400, Konstantin Ryabitsev wrote:

> > 1. provide a way for someone to submit a patch using a web interface   (but
> > still in a way that From: is their corporate ID)

> If you do this, what happens when a maintainer/reviewer responds to that
> patch and says "looks good, but can you change X and resend it?"

> How will they get that message if it didn't go through their email
> system?  How will they be able to respond to it?

If they're using their work e-mail address like Konstantin says they'll
get the reply there.  Probably any response from them will be some top
posted thing with HTML but this happens often enough currently - people
often use git send-email or something to send but continue using a mail
setup that's not really what's expected for kernel work.  Usually it's
not the end of the world even if people get a bit grumpy at them.

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2kXH8ACgkQJNaLcl1U
h9CmyAf+POhugufPprT2M1X/YLC14hjZXhyNyDvGLA999aoQKz+RRmNjxCJBY1ZZ
IYA9+vdrFi5AGRTiYTBjc77EZsunGaW5gxKCChQX3jvPh0siBEM9FB5LcqGSo+vQ
+qBYENYRWx3F+wRlL0ZDvp8gdE0u1DTbE2IFBS551PZ5H4kSJdi2nzqJIa+P3bK3
E1PwYzw61B1iz6ADzS+SO7htbBICh2a/v0LB7OwHd08J+/MFqnrVsUyOEAVHUal4
rtiYkGtQgYYyD/CpRuro4jX204TpqWACwvDuIaNJq+65r4Ud+cOGY0dRuyZZEUCs
ASAfi0D58UumlpVj4+k++czgx/mGWg==
=qpb2
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
