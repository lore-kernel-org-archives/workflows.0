Return-Path: <SRS0=PtRO=YK=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCF1ECE58E
	for <workflows@archiver.kernel.org>; Thu, 17 Oct 2019 11:25:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A149B2089C
	for <workflows@archiver.kernel.org>; Thu, 17 Oct 2019 11:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571311518;
	bh=uVitVzZZQ5+gsHbqQVEc63kxIHRnn129fLEJkIlJQPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=yLN5j2tpWQ6kR6/oxgJXfLJiMaDEXCtGuxd9y3tAVM1/fAerYi3DM3CT/rV7nzZpx
	 gxWeeRtiyiWpqGqjFWGY6CDKX35CbXYlPtnW9s6NW2uVb0PRz/k+IrTyk+kNiCOSiw
	 7NX2yeM1YM7MQZ+8DRfKYEv7b9W4oq/v9+kHzVGQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406217AbfJQLZS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Oct 2019 07:25:18 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:55370 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405890AbfJQLZS (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Oct 2019 07:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=fq+hMAVIhxs1UI1X2J8exInk+KO/eq3WcW1QkeaH1Zs=; b=fZGA+8iGxiYWRb8YMoko6XUf0
        xSFQce+TZuZDleQHnmti9mHdzEPonMMKk3fymtWDsSrr5RqdQyhDyghI0oLDleKOVymIXMINNC6Vo
        hTJUaT3kWRH+mWoz/Ih3BBW+rDfaKrR4Ia9FR+csh5WhsHVA3jxieuoZMGatwII+xbtMY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iL3tc-0000on-Ih; Thu, 17 Oct 2019 11:24:44 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id A967D27429C0; Thu, 17 Oct 2019 12:24:43 +0100 (BST)
Date:   Thu, 17 Oct 2019 12:24:43 +0100
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
Message-ID: <20191017112443.GD4976@sirena.co.uk>
References: <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu>
 <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015015425.GA26853@mit.edu>
 <CAKMK7uGtvqFSw+wOBeGjV88DeyUoMTV3+F4Fpqv6NGUBCkAAgA@mail.gmail.com>
 <CAFQ2z_Pxc=0LjEieUC7Dz_sQiUKBr2oKUVrW7Fppj5AQbD_W5A@mail.gmail.com>
 <CAKMK7uGseMAmmLkawkaMMJgK=XAXoK+vOP8Uo9obXpss_v+WYQ@mail.gmail.com>
 <CAFQ2z_OVwS0Ups1QCEvJBFTsZmsw1u25bJh+a3xArjhXggLqcA@mail.gmail.com>
 <20191016190852.GG4881@sirena.co.uk>
 <CAFQ2z_PVSO9Uas0sRNbEOSTUsKqN_49+u+HYuZemz_hECRPLKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
Content-Disposition: inline
In-Reply-To: <CAFQ2z_PVSO9Uas0sRNbEOSTUsKqN_49+u+HYuZemz_hECRPLKA@mail.gmail.com>
X-Cookie: Shut off engine before fueling.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 17, 2019 at 12:22:18PM +0200, Han-Wen Nienhuys wrote:
> On Wed, Oct 16, 2019 at 9:09 PM Mark Brown <broonie@kernel.org> wrote:
> > On Wed, Oct 16, 2019 at 08:56:53PM +0200, Han-Wen Nienhuys wrote:

> > > With the email workflow, isn't it hard to keep track of which patch
> > > went into which tree? Something that tracks the identity of commit
> > > (like Change-Id) as it travels across trees could help here.

> > Once something's in git it flows into other trees via merges so the
> > commit ID is stable, the exception is backports where the ID from
> > mainline gets referenced in the backport.  Normal development doesn't
> > use cherry picks really.

> Right, so once it's in Git, the review story is done, and everything
> we've discussed so far is really only about what happens before the
> merging?

*Mostly* - pull requests do get reviewed and may need to be rebuilt but
pretty much.  It's certainly an out of normal workflow.

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2oT3oACgkQJNaLcl1U
h9A7Zgf/QDhACZoNUlB/ORZqGUzkIt5Cu6DnbBi80ikfiuxKb9Y5IFP2sKJGINYb
n3lwpoDRTuiDjd0SrVfL2YEIcmHdCmBcucKrT97myNVCcJGoyLry/2ML4YtBTF5z
czJy9W9vvTk+L6BMMwsLG8+6AE1smJ+aGDExhyACjS/WL9wYHyZgPD1JfMs641fS
beEb8kxlksOBIlXdEMsO0KrM1FkH1gRTUegOLbdmvUZYrI+JadesJyo9HdeJu7sw
Foi5pLkNkACp+9QKTe5Ke5Cw4Riwb2p1cT/i34RNs7B5I1aQ1bFxdyzpOiCz5tYL
CFMd53KtbxvHI5QAlHphJi3zZn2zOw==
=dKjG
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--
