Return-Path: <SRS0=dP5A=YB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8367DC47404
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 01:00:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23D88206BB
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 01:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="r+HlNJEo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbfJHBAO (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 21:00:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33069 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728983AbfJHBAO (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 7 Oct 2019 21:00:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46nJt16W7Kz9s4Y;
        Tue,  8 Oct 2019 12:00:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570496412;
        bh=36BAr4ZILRX9U40qxcSgXZDcJ9U/qC05I8Gimjp1W+Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=r+HlNJEohfpLpSsSjliUoBoFuFO4sxrXDIJSEe1rDH+1bzR6EWWzJ9RANKX977vYU
         jB58oeIYhWKSW9hzbvOO5Dj88crQjvIpEECLBNcMUkXOix6eLGkYU9A8KXn3SQXfTW
         JyER43zc+thDWEjhw6cwcYtjy90aM594zlJu0OjDkEQ0Cu1QcbR2ZupTRpXgVLjxx4
         AyBHIUVMac6YW5pHKcXH5bro3YUu9V2YHir6IRo5qVlWoKKuinHLhWE4dyfQtOIHok
         edqLR7t1Y5SVoIva7wBt7U2ew6zYbSq1eYaLM+W/+y8bgInIsHD6tx1tAUjFQ4lE6T
         1F8cHHLtxVBZw==
Date:   Tue, 8 Oct 2019 12:00:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191008120009.2fbd9886@canb.auug.org.au>
In-Reply-To: <20190930145123.GA4001@mit.edu>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
        <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
        <20190924185312.GD6041@hmswarspite.think-freely.org>
        <20190924202423.GA14425@pendragon.ideasonboard.com>
        <20190924222502.GA11633@hmswarspite.think-freely.org>
        <20190925205036.GA7763@pendragon.ideasonboard.com>
        <20190926004045.GA20302@localhost.localdomain>
        <20190928185848.76c85a9d@oasis.local.home>
        <20190929115722.GA26820@hmswarspite.think-freely.org>
        <CACT4Y+Z8_fABZSXahiGaOxKiPa+K3hxhvH8EVenuuqOs3aCwZg@mail.gmail.com>
        <20190930145123.GA4001@mit.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dkMYlUsj5_0U5GYKV9Ts/o7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

--Sig_/dkMYlUsj5_0U5GYKV9Ts/o7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Theodore,

On Mon, 30 Sep 2019 10:51:23 -0400 "Theodore Y. Ts'o" <tytso@mit.edu> wrote:
>
> Look at git as an example; everyone uses git because it is clearly the
> superior solution, and it made maintainers' lives easier.  But for a
> long time, Andrew Morton's -mm patch queue was maintained outside of
> git, and in fact, was accessible via ftp.

It still is maintained with quilt and accessible via http (no ftp any
more).  I have to import it into git branches in order to include it
in linux-next.
--=20
Cheers,
Stephen Rothwell

--Sig_/dkMYlUsj5_0U5GYKV9Ts/o7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2b35kACgkQAVBC80lX
0GwyKQgAjLbBNR12wlaotJs/0CqF3T+8GqQZJMR4JVO/dr7/29/zq69CaKS+fFWz
2RcXZJuuCA3JZZJCTkQoCJE3I7wpR0y5ZEWdiBysA9j3WVT9j5R+0MbUpjDHKGtW
ux6UnbLMzE0e8tlFjwiPycf1IiKuNFrGtF2ooDWYKeD+KtAqz3ACwSSWQSyhd2Yz
OZuYwCDNZ8ye9VZZzSZ2PeVLcbjgJyPC0K1d3tmwNOeGdIRMPl/gNCD1xGHis5w9
XJG22RXf7X+JadIZqr+sQZmtMrLFNgaur2ZqTiEbjctMCB57HIjtK0EnegUOUWVt
BsUWRFqYZ5++Ekt58NYx75M2Cwv+BA==
=X6i2
-----END PGP SIGNATURE-----

--Sig_/dkMYlUsj5_0U5GYKV9Ts/o7--
