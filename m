Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2063CC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:17:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E81B4613B9
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:17:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233111AbhFQPT3 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:19:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:40470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233129AbhFQPT2 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 17 Jun 2021 11:19:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A83A610A2;
        Thu, 17 Jun 2021 15:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623943040;
        bh=Jj1tn9jtr/zcUplkIWk9hN7uIdrXkW/n1pYA987Oh7A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LK6aNrUXfNc8oqW1lEK4mD/Xp+7PUDVkQV9zaECZp+qe5Ha4mGp/t+8kMFEIELvEM
         kc8waPSijPvBlgY+/ZRIcW/ruqO08S/nc2mfrc9rvnt2rJTrg2+ua4rLYW+T1TiJK5
         rSkj5mMBSN9jerEO9KDDGeYjJoboSFneEE083OYCsVoE6uVfDvlTEw+8f+pOAl5qJ1
         fmDq+PFBWaZ2YhNHflYE7qVHVMGEL47zoycXNj09j1aXpCQaJJmpYyTxY8FoLZUwY8
         52Z+Tr+52dmtfV/R7eKGzLy8wn/Wp2L27FJHjYU1We/2/IZraJrZ5M/gWHi5HTKEIE
         rWI+L8eAzvv1w==
Date:   Thu, 17 Jun 2021 16:16:59 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Jiri Kosina <jikos@kernel.org>, users@linux.kernel.org,
        workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210617151659.GF5067@sirena.org.uk>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <YMsGoI0UdbmUebhX@infradead.org>
 <nycvar.YFH.7.76.2106171031220.18969@cbobk.fhfr.pm>
 <CACT4Y+YoHYCKaLdZFSLqKsMz1j72i=k12FVpmSo-OyB7rCorsw@mail.gmail.com>
 <YMsfXuykH6z0ZbpM@infradead.org>
 <20210617145728.nahkvtxapozccm6c@nitro.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="27ZtN5FSuKKSZcBU"
Content-Disposition: inline
In-Reply-To: <20210617145728.nahkvtxapozccm6c@nitro.local>
X-Cookie: But it does move!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--27ZtN5FSuKKSZcBU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 17, 2021 at 10:57:28AM -0400, Konstantin Ryabitsev wrote:
> On Thu, Jun 17, 2021 at 11:09:34AM +0100, Christoph Hellwig wrote:

> > Because I don't waste my time on the kind of crap that comes from
> > github.  If you build a separate webinterface that allows anyone to send
> > a proper series from a git tree that is all fine.  But github is toxic.

> Won't this just end up reimplementing a lot of stuff that we already get "for
> free" from Github and other forges? Yes, I know Github is proprietary, but so
> are many SMTP gateways used to send the patch series. I don't see how what
> the GH bot would do is different from:

I think part of the concern here is that people have some standard
expectations for how projects they work with on Github are going to
function so if people end up using Github to submit patches we may end
up with some culture and process mismatches which could cause issues.

--27ZtN5FSuKKSZcBU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDLZ2sACgkQJNaLcl1U
h9Athgf/UoqZqegCFiwodoYvqk+5SPB5aazvmyX4bY1tT7YEriOeAFFwjUddgLFP
2BhJmw8FwYNjJfDBEWV35fllOZFJta8Ec807/ax+wT4y23V47ME0aAKO8JImYDy/
jqPJ6Llrs3u64OkBExq4D0nURnjWdz2UdKz8Y2PWmDz2/P+IJdXCZQ3StfuRxI1p
q8lIEUTSen+1eD83gy9XozXrn4eLzrQDv9OMrIVyoVGfeRB89K3kfBBO+b0dV2IL
t+Zn97ArqKgBDPUo99loU3JKD85phQ3JT/f2BRsCudQg4tQgIC9KgMszcHfepr46
VPU6YdScQVAhXn+P6W6/iZqkRF7AwQ==
=D8oU
-----END PGP SIGNATURE-----

--27ZtN5FSuKKSZcBU--
