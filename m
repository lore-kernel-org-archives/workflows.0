Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F422697A6
	for <workflows@vger.kernel.org>; Thu, 21 Dec 2023 11:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+p1/bzR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F03C433C7;
	Thu, 21 Dec 2023 11:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703158006;
	bh=rxqgTM8amFefzl7/Qm+IJag8HmUjPwvE/KG2EAeEilQ=;
	h=Date:From:To:Cc:Subject:From;
	b=O+p1/bzRP0lfp4d9lfXeKAXnLoMPv+6JcraRPSvMf9k4m1f2mkru+XytCRZWvPhkY
	 kY7C0NAT0cD1bl5pZUqiV1M50FVGw86n3Jck+18p3IJffKvGbduQkihM14/sj9VaQ0
	 QWkpaYF7o0ByO4dcOEBfFx7S5X1NmxdGfSlxFQumtY244N2HgH4H3zM0v+6OxH8oaZ
	 sBv3+JWK6fjfbm5Xb+MpkhFrrzy01hmCsCtWYA64TSTg5u4/htHolrWZ/H9nqdnUup
	 soUXbBBR/KrwRMnBhxNBB6F90bDu5fEb/7uGVk5hHiatkCPJCF+bIyBiwPVsD6OoVx
	 XzUFoE7sOpUXg==
Date: Thu, 21 Dec 2023 12:26:43 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alejandro Colomar <alx@kernel.org>, workflows@vger.kernel.org,
	Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>
Subject: [PATCH] MAINTAINERS, docs/process/howto: Update man-pages' maintainer
Message-ID: <20231221112533.5259-4-alx@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AiNUP1dzkE+95h15"
Content-Disposition: inline
X-Mailer: git-send-email 2.42.0


--AiNUP1dzkE+95h15
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 Dec 2023 12:26:43 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alejandro Colomar <alx@kernel.org>, workflows@vger.kernel.org,
	Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>
Subject: [PATCH] MAINTAINERS, docs/process/howto: Update man-pages' maintainer

Michael retired from maintaining the Linux man-pages project in 2021.
See commit 06e72cb19c74d3b1d661609c698ee26d7b6e4d7e ("CONTRIBUTING,
README, lsm: Remove mtk as maintainer") in the Linux man-pages
repository.

Reported-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 Documentation/process/howto.rst | 3 +--
 MAINTAINERS                     | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.=
rst
index deb8235e20ff..6c73889c98fc 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -82,8 +82,7 @@ documentation files are also added which explain how to u=
se the feature.
 When a kernel change causes the interface that the kernel exposes to
 userspace to change, it is recommended that you send the information or
 a patch to the manual pages explaining the change to the manual pages
-maintainer at mtk.manpages@gmail.com, and CC the list
-linux-api@vger.kernel.org.
+maintainer at alx@kernel.org, and CC the list linux-api@vger.kernel.org.
=20
 Here is a list of files that are in the kernel source tree that are
 required reading:
diff --git a/MAINTAINERS b/MAINTAINERS
index 509281e9e169..a59214c48e52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12745,7 +12745,7 @@ F:	drivers/mailbox/arm_mhuv2.c
 F:	include/linux/mailbox/arm_mhuv2_message.h
=20
 MAN-PAGES: MANUAL PAGES FOR LINUX -- Sections 2, 3, 4, 5, and 7
-M:	Michael Kerrisk <mtk.manpages@gmail.com>
+M:	Alejandro Colomar <alx@kernel.org>
 L:	linux-man@vger.kernel.org
 S:	Maintained
 W:	http://www.kernel.org/doc/man-pages
--=20
2.42.0


--AiNUP1dzkE+95h15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmWEIPMACgkQnowa+77/
2zJJ5BAAiquDS/FSpF4wyxdnJxJU3qWf1R7bybxqQJj0anbyfQF+SO7KQvTKzki9
4G6cctPltygBODAD536BVVmlF5OKKUjIqn9+haqRpNqTNeT9XWTcRZ2UjB0jWe6C
P8+6GR+lt/7a9ULPNf9c0VC9TjF08NQ6LYfoFSc+RF8uWAnMxIyK4IC6Yz+6GIhw
VFp2Tmy+hOQUKlhgMRBUryGEeb25W7riXisNBVlCBbPE0Oi3Cv0EODTcudpGNTNb
nYzNBIHkCkCbDyg6+bp3PUkazo5H5l3g858Cd1bdaG+Nf5r+DevRcrUv2Np7RHTz
+bciJTkIK06UbHxJVJBSWUaht7K0rhI1axR/ptg7C+QmqXjWe6++XbVPk6AM1jML
KasCdMyy04CwkXA6Kea0DtzWL6BtzyUkkfZHitC0kVepxbgomEGyFqcg+8MV61rV
ObkixM7DEXDl+KLerSKRbC9eejzUzl5GZLkMPRuNpfHtseQkt8J+k8Yk6Vf69lfn
+fa5zd9rvcrGYxAFb5H9Oav423edrAKLzNVQMGagkR68sqSMNT3BXBHUYelYlYAL
m4Hzfm3TqujYAEZqRmsUbSs+lngHfjbpernn1kJCBKhlwRfwuJWNKy3Od+T3nw/f
M4Z0yRnKVAiMnQYeXxmvL5/Ebtiu51jjeqOjxNyfZvISG97zXF0=
=VEId
-----END PGP SIGNATURE-----

--AiNUP1dzkE+95h15--
