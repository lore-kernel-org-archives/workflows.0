Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7982DEB64DC
	for <workflows@archiver.kernel.org>; Mon, 10 Jul 2023 19:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjGJTHB (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 10 Jul 2023 15:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjGJTHB (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 10 Jul 2023 15:07:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A687FB;
        Mon, 10 Jul 2023 12:07:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 07839611A5;
        Mon, 10 Jul 2023 19:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 938B6C433C8;
        Mon, 10 Jul 2023 19:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689016019;
        bh=vEzEIsBNbtl8f9ZOv0DgAmrPaubpxPl9uqkry5+adfI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VFnbLOYydVuEmYtfE/ZHrmqQpcZdyIXkfmGfG+Z0pgC8SbkeFybDMwulx7GmI6hy3
         HY8fxmjk1CZYO9bSLWXQDmAYH4ofzrrT3eTAyfwoHe+8Rr22s6ErLk7Gd00V3P/owj
         ShlV8MJDEb+iQjvj8wCpQ9tQVYUu35DAW6rwiKzfRcRbuhz6sjrxrQueBG0SHrR2Ma
         6VElPBIE6J3Ihm7ouCLV94CTjR5w+E6zwj2A4+x5fnbv5f4J8EPyZECv9CLfaWK0Rf
         LReYdF3O7jo2bi6YptvaRuGreiye9S634hdJi7f1Ha5fW1UZFFWGzfWYk4Zh3827ql
         x5vzM6NUfOzow==
Date:   Mon, 10 Jul 2023 20:06:56 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: Docs for base maintainer expectations?
Message-ID: <20230710-snowboard-bannister-7ed66c8d742b@spud>
References: <20230710115239.3f9e2c24@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e2PMl8QVKprJPwOd"
Content-Disposition: inline
In-Reply-To: <20230710115239.3f9e2c24@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--e2PMl8QVKprJPwOd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jakub,

On Mon, Jul 10, 2023 at 11:52:39AM -0700, Jakub Kicinski wrote:
> do we have any docs describing what's expected from folks stepping up
> to maintain (small-ish) parts of the kernel like a driver or a protocol?
>=20
> Experienced developers / maintainers differ like the beautiful
> snowflakes that we are, but outsiders have much less familiarity=20
> with the landscape, and frankly sometimes much less interest in
> participating once they code lands.
>=20
> Which makes we wonder if a simple list of responsibilities would be
> useful as a baseline.

> I haven't spotted anything in Docs/process but
> perhaps someone has a local version for their subsystem?

Given I figure you did this on with a -rc1 based tree, which would mean
that what I wrote probably does not fit the bill, but I tried to do
something along these lines with
https://docs.kernel.org/process/maintainer-soc.html
for which my target audience was people picking up maintenance of
DT/soc drivers, which I hope there'll be a few of in RISC-V land soon...

I suggested adding things to it, like putting the trees in linux-next
etc, but review feedback suggested that was unsuited to a subsystem
specific document.

Thanks,
Conor.

--e2PMl8QVKprJPwOd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKxW0AAKCRB4tDGHoIJi
0v7IAP0QAnShDpr53l+90D7z6XGzKZtQkQRemWL4ByMEH5a1xQEAh/fg+oTKxu0S
78K/7CmB/erSl9CdFuR9hdpkS/4yyw0=
=M1mc
-----END PGP SIGNATURE-----

--e2PMl8QVKprJPwOd--
