Return-Path: <SRS0=ZkQc=ZD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B56C43331
	for <workflows@archiver.kernel.org>; Mon, 11 Nov 2019 12:08:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85E4A206BA
	for <workflows@archiver.kernel.org>; Mon, 11 Nov 2019 12:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573474089;
	bh=iTAeAwSJ/NQcze7PiD5uW1P2epYQSINes5+57+vkdZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=NHXWE7HGiu2dyEtms67GvGy4tmGqARnt3iSfq3BthJLe7Cs/SYQ9+G/D0S/6uxAQA
	 njMct9V+am8d9uJf5YJFk0rlBqMPvv/iJHuDRpsgGBfDALaY6UH20e5/N6dlhtn1xR
	 U26cZ5RMyyALVw3n/RNgHNQC8eqza8Z6GHkoAn00=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfKKMIJ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 11 Nov 2019 07:08:09 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:38042 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfKKMIJ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 11 Nov 2019 07:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=dZYsK5/GDszAw9Dj/XohPsP4bbpM1rDbca1WXgD7004=; b=I+emo2/8kw4QFoxNrUTUzuFmG
        yrAU3w6hkyTH5/zf/xPEIxR935JAyr+N5witFXgTTCElm59FuycsxVSRQ+dz4qA+vC9EvQp/Q3XrH
        CzmDqeFC2Kv6qxx4eI0cP77XhGigkChJAq0MQl6184mfr6G8c0lTrKH1alAHfak3tqDfE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iU8UD-0004Ol-Ki; Mon, 11 Nov 2019 12:08:01 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 5CD0127429EB; Mon, 11 Nov 2019 12:08:00 +0000 (GMT)
Date:   Mon, 11 Nov 2019 12:08:00 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191111120800.GA4264@sirena.co.uk>
References: <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <CACT4Y+b=QmYDr97HMF+qXbQ2XxUA8EmYK+reFYtcRxqw=zFfzQ@mail.gmail.com>
 <20191108140249.GA23325@mit.edu>
 <CACT4Y+YpH6epuXBHX4RFiucgDqXkCij2v-o5ZA-q3Hfz0JT5eg@mail.gmail.com>
 <CACT4Y+b1h5pJy5DrRS-MtABY7KF+4u_17yPgHLMx1JdCmf3AXg@mail.gmail.com>
 <20191108141707.2yfxoychd5j3oewn@chatter.i7.local>
 <CACT4Y+ajDz89d0TNU1pS9hS_+bgm5nrPKSAGJ5C=9L0dOyx3mw@mail.gmail.com>
 <20191109043106.GC23325@mit.edu>
 <CACT4Y+a1NsFgaLYx4JQORLoyUs35PDwVt1f-PoiJYv-u8AZw1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
In-Reply-To: <CACT4Y+a1NsFgaLYx4JQORLoyUs35PDwVt1f-PoiJYv-u8AZw1g@mail.gmail.com>
X-Cookie: A lie in time saves nine.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 11, 2019 at 10:35:10AM +0100, Dmitry Vyukov wrote:
> On Sat, Nov 9, 2019 at 5:31 AM Theodore Y. Ts'o <tytso@mit.edu> wrote:

> > Essentially format=flowed is only supposed to be used when it's
> > considered OK for the receiver to reflow (or not) the lines any darned
> > way it wants.

> But for me the point re email still stands: why are we even spending
> time discussing this? Why are there such extensions with MAY status?
> If one doesn't care if the received with recover the original message
> or not, why caring adding/specifying these "format=flowed;
> delsp=yes"?...

> Obviously somebody in the middle got confused about these flowed/delsp
> as well and either assumed that they are MUST or assumed that
> preserving precise text for emails is just never important...

Not sure if you're looking for a serious answer here or not and it's not
really your point but the use case for format=flowed is for plain text
mails.  The sending MUA should flow the mail into 80 columns so it will
render OK as text but if something wants to reflow (eg, to fit within a
window) like it would for a paragraph in HTML mail then it can.  It's
optional so that things where the formatting is important don't get
disrupted.

> Regarding another mail agent: again this only proves the point for me:
> this is what tool developers are forced to be spending their resources
> on, rather then working on adding more useful features...
> I don't even know where to start re switching mail transport; how much
> the switch will cost? what are other transport costs in the long term
> maintenance? what are their problems?

We're not going to get away from interoperability problems no matter
what we use, especially if we are mixing things intended for human and
machine consumption.

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3JTx0ACgkQJNaLcl1U
h9CYdAf/dkv4T1lvCZa3+ZXks0O+/89JOz1Z08xp/uNeRe0se6ekBvmIPpepaY0M
4Oj17UAsavZ9MheAK4d+vp3NLWCvqf3CPxTGkwYS051Y8pnzK2+uOherGpBSMUl0
9NLg/PKJ/y921SUIdO58manIjsOAO6ufbaNGh7OyAwUg3B0xCoqRKc2txX47FAOX
qUHhH9s+Kp2w/Ye46xWw+bKxutEgvT2x6ZnZsvuthlIpDALwhU6qVRXm/iv0b8af
xDybjVPcFDCidSHLS203ag3DHlnn6RYwVJviq4rif1JY+b/d3Fyfp4z5HStTQAvN
ZZgef/hbZiwikPBqUgtkim1mVYXt3A==
=IfzF
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
