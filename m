Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165A2C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 20:03:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB87121848
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 20:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571169817;
	bh=G2ZGndympFdCkl0GC52sXMZEEujvIx5GRG6AQSTP40w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=K8T5D4yv8f57ipY47ND/CYwNU090hfzi3WEnNqNGJbd+zCFK1aZ6MjqBVpjDknrQF
	 Y8fppC5sgjE078IUH1Xcb2w60DOLp2civlyvnla3lu5fQ66oIhIuO5jdJ0HXDqSPut
	 GeHeyMt4G6Yrtj6RzPPqsk9fTrh3gQFHtAflvEdg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732753AbfJOUDh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 16:03:37 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:39684 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbfJOUDh (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 16:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=oOIrn3owNj1ACAVPu1ARonsNrIyo78wUPs8KJCA/AWc=; b=dLJGN4mPiItD7SIjAM4hVtZJQ
        wW2q+pVzP+84IkpO1xyTKB0j625NcF7o5I40BYh2PWzeDIMHuvmgnuGA9J5OLDlTpVa9TlgllhOVM
        19e/WyoWh1fgOQCPsaGIopkTbQ4RFtd3iQJTSBf+FFIthBXpTBBLfmWnLONxmMchYAaaA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iKT29-0003NW-1i; Tue, 15 Oct 2019 20:03:05 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 4AAAA2741CD7; Tue, 15 Oct 2019 21:03:04 +0100 (BST)
Date:   Tue, 15 Oct 2019 21:03:04 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Han-Wen Nienhuys <hanwen@google.com>,
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
Message-ID: <20191015200304.GD4030@sirena.co.uk>
References: <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu>
 <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015160712.GD1003139@kroah.com>
 <CAFQ2z_N0Hriv68HajKZoNg1AyXzd_GqT8a2sDoCRZkUJy_vKSA@mail.gmail.com>
 <20191015193351.GB1152701@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0/kgSOzhNoDC5T3a"
Content-Disposition: inline
In-Reply-To: <20191015193351.GB1152701@kroah.com>
X-Cookie: Yes, but which self do you want to be?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--0/kgSOzhNoDC5T3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 15, 2019 at 09:33:51PM +0200, Greg KH wrote:
> On Tue, Oct 15, 2019 at 08:58:14PM +0200, Han-Wen Nienhuys wrote:
> > On Tue, Oct 15, 2019 at 6:07 PM Greg KH <gregkh@linuxfoundation.org> wrote:

> > > Anyway, my objections:
> > >         - slow.  Seriously, have you tried using it on a slower network
> > >           connection (i.e. cellular teather, or train/bus wifi, or cafe
> > >           wifi?)

> > I did (train wifi), and found it to be workable, but it might be that
> > I have different expectations for speed.

> I guess it depends on your train :)

I do the train thing quite a bit in different countries, it does depend
a lot on where you are.  A lot of the time the issue isn't speed, it's
reliability - the most common failure mode I see is that the connection
speed is fine when it's there but it routinely drops out for periods in
more remote areas or due to cell handover issues if you're moving at
speed and if you're working interactively even brief drops are very
apparent.  If you can queue up network interaction so it can happen
without you having to sit and wait for it to complete (or manually retry
it if it times out) this doesn't really cause any difficulties but if
it's stopping you from proceeding it becomes an issue.

--0/kgSOzhNoDC5T3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2mJfcACgkQJNaLcl1U
h9DjPQgAgzKR+d2j/k/Zyi9CLZz1DCQui+fnbAx3PKY6tLrdQzaqB5OFJXwRfWGu
OKM9mcs/wZX0Bd4WHK6sPW4lzo5G6dQ41lOUssl9mfgxgW8sYJ/ZTNH7jk48XnYW
rhCY8wBhbjVz1y90BYrUjJN9i23c3rf2nGPIFXJd+QCam/fE9V6m7nkMO6nDAJF/
kjzVbjLxaqL8VLtIJBU1Utyz8C8f4/W2qNYys18LMq6RrCMm3OXvrxFOqrtsUWYv
I1SvUvEYyAGKxcYNIpro1rNM4ejsETiMUz2owiO7YeyRw9Jgdd2KIYRMg7uQmsU+
Oy2VZWryiJgxbscTgflJZggOgB80bw==
=l2gg
-----END PGP SIGNATURE-----

--0/kgSOzhNoDC5T3a--
