Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E2DC197A0
	for <workflows@archiver.kernel.org>; Mon, 20 Nov 2023 20:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjKTUN2 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 20 Nov 2023 15:13:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjKTUN2 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 20 Nov 2023 15:13:28 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC724CC
        for <workflows@vger.kernel.org>; Mon, 20 Nov 2023 12:13:24 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8765AC433C8;
        Mon, 20 Nov 2023 20:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700511204;
        bh=4sUDEp6FYMfD2QrfOBC4znr4NhcbtUaY8p3AqsjaVX8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pmySCxX1nvFtdQ8UsIeucqu8wgXj0Q3rdUEYubyupWh6P7ZWXqu9pglCx7VFRrVzq
         Jj+65pdeF0zLXsCGOO9B6c6RdpYMmpkN87Brsa2BykPRiNMS51ZlFfPk3dwlBKLSJh
         94ZMOlh+ksE2Yt2DPLiUkLvCqMTo2Htk92h7Cer17OmW8gYolLT8LRDpV2a2dhGjzR
         +q5totgxMTv0OU7XoB+gQ/0+SpcGpky89v80FB9KUFp97xwdhrC/i5JSDRtFMRgcoB
         rKwVkk9S7NsBznSw/9kUbx4dbi0yRxFA74tTZTbaXwgBa0dyK95gK65q+YSChZSYb+
         u2+5NGOfjzPgQ==
Date:   Mon, 20 Nov 2023 20:13:19 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, andrew@lunn.ch, corbet@lwn.net,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net] docs: netdev: try to guide people on dealing with
 silence
Message-ID: <0d80ee23-e106-487e-a824-b048948a859a@sirena.org.uk>
References: <20231120200109.620392-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RbKDKJRhjswcAM1A"
Content-Disposition: inline
In-Reply-To: <20231120200109.620392-1-kuba@kernel.org>
X-Cookie: <Manoj> I *like* the chicken
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--RbKDKJRhjswcAM1A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 20, 2023 at 12:01:09PM -0800, Jakub Kicinski wrote:

> +Emails saying just "ping" or "bump" are considered rude. If you can't figure
> +out the status of the patch from patchwork or where the discussion has
> +landed - describe your best guess and ask if it's correct. For example::

> +  I don't understand what the next steps are. Person X seems to be unhappy
> +  with A, should I do B and repost the patches?

This bit (modulo the reference to patchwork) feels like it's generically
good advice and could find a home in submitting-patches.rst or similar,
not that it isn't worth repeating here.

--RbKDKJRhjswcAM1A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVbvd4ACgkQJNaLcl1U
h9D67Qf9HPgF7lQhJm9GidXfuMsvjIBSe0kH7WnFQND6lioBmMb3AdRniHDNKLx1
YJLSKE2SAdlUXuFpGtfqwvf4AzaYnkNcDpxPdJBJpeuN+DkJXRguKy6fuzux4CzL
FKjz8d7B+MIVxB7eaZCi6nuLPoHetW13OSZ/b1mepPRfSkaNDMQtUJ0kJadbzvR4
eeW+qjZVhislHHtjneQYsgmY6qQRCDBeFryFKdN0ucc5sy/NRzKseWL5dMAzr92D
9p54Exvw5g8ndtMCarOR2/ULR76NRJfDRBd1gKp1MflakE778m3MZsoG7k5342B4
3YcT26WP6qpUpLZ7QjTiLGycXUVM/g==
=d0ou
-----END PGP SIGNATURE-----

--RbKDKJRhjswcAM1A--
