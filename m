Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87404610B
	for <workflows@vger.kernel.org>; Mon,  1 Jan 2024 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r7mttmUk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32662C433C8;
	Mon,  1 Jan 2024 12:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704112980;
	bh=R0ntuOFbjYsJOk0RMs5uz37Vz0D/Wieii6bcWekwZOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r7mttmUkVY4vHMBqVeSSvl1nuc/u7zv4Tcaa5LKAuoALQYSX1pyC0NzeOhDM8cjaH
	 pBnTlM1ouNkxPPoaBbOf0/XyFLvD3uzTfMnq62w1oL/8DBHQHJe7m+NxdEmbbJIV18
	 lwaTmOl7shZF33mb41SKd31xNaBnOF5jRbnI0W16tjjVP3vMumoq7hW0ece3Ib03NJ
	 hh90o1iJ/ZWI4GERpte6laF1PxfaYPjJg7wtzm32IMlIcBZOQ4jUl6lFHl82OJITz9
	 HjmyaFegGa2Gw0gxxZItvDXetVTwqk+XCiLJQ1GGs1Mu/5cdEWE9Azlo7wAd0wBn5O
	 T5IKhtcUrsTgw==
Date: Mon, 1 Jan 2024 13:42:56 +0100
From: Alejandro Colomar <alx@kernel.org>
To: workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc: Alejandro Colomar <alx@kernel.org>,
	Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Michael Kerrisk <mtk@man7.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] CREDITS, MAINTAINERS, docs/process/howto: Update
 man-pages' maintainer
Message-ID: <20240101124242.8059-2-alx@kernel.org>
References: <CAMuHMdXO58KyZF2TuUaS-HrK6ry2ARHtDntbGT86YQTwieXs4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zOSQyqZkxRABoVqR"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXO58KyZF2TuUaS-HrK6ry2ARHtDntbGT86YQTwieXs4Q@mail.gmail.com>
X-Mailer: git-send-email 2.43.0


--zOSQyqZkxRABoVqR
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 1 Jan 2024 13:42:56 +0100
From: Alejandro Colomar <alx@kernel.org>
To: workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc: Alejandro Colomar <alx@kernel.org>,
	Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Michael Kerrisk <mtk@man7.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] CREDITS, MAINTAINERS, docs/process/howto: Update
 man-pages' maintainer

Michael retired from maintaining the Linux man-pages project in 2021.
See commit 06e72cb19c74d3b1d661609c698ee26d7b6e4d7e ("CONTRIBUTING,
README, lsm: Remove mtk as maintainer") in the Linux man-pages
repository.

Add him to CREDITS.

Reported-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
Link: <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?=
id=3D06e72cb19c74d3b1d661609c698ee26d7b6e4d7e>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Michael Kerrisk <mtk@man7.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 CREDITS                         | 7 +++++++
 Documentation/process/howto.rst | 3 +--
 MAINTAINERS                     | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/CREDITS b/CREDITS
index f33a33fd2371..6781d4eeb9fb 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1828,6 +1828,13 @@ S: K osmidomkum 723
 S: 160 00 Praha 6
 S: Czech Republic
=20
+N: Michael Kerrisk
+E: mtk.manpages@gmail.com
+W: https://man7.org/
+P: 4096R/3A35CE5E E522 595B 52ED A4E6 BFCC  CB5E 8561 9911 3A35 CE5E
+D: Maintainer of the Linux man-pages project
+D: Linux man pages online, at <https://man7.org/linux/man-pages/>
+
 N: Niels Kristian Bech Jensen
 E: nkbj1970@hotmail.com
 D: Miscellaneous kernel updates and fixes.
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
2.43.0


--zOSQyqZkxRABoVqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmWSs1AACgkQnowa+77/
2zIFJxAApqQa4KIG0qN5pwrWm15a89jeTSNGXO0iseFdu/T9dwQwUUqYvtBPViL4
3rZZNKB9bTJITFrA41iB2DZJBdM+GParnrCE/PZgZA88c/uqF44EuUeWofM6uODe
3l+N9ab7dbwRH57Tn8/NVdoPl+89t2hu047QMbJoIDvXQKHnxSUdYMYBonxYMXMj
7MQ4rEuLowlBVaXeEBIZWq3iD/r+CedU+r9f7Q37hSidAu/c+JDCXZ5/RST2gK4q
3wybEW+pQQkJGGFk7J1enTeiYSDLm1Pzsn4beIVBtVTdGftkb81UKwYrNDZGYJVB
VrBSYiYHvDH98W7mMHFR2oQLbG0d1LpTN2RbpDk0Wy8GceZ1sKxaLP73Lcrxgu4F
mld/JjtwoFwsnp6wBmsoOZgihox0qotIHHW9tp8ThzfEB0igqdrBpQRmzwFud5Ur
xciANgeIfXLN0Ycs3l2DIyZ1Z7w10KprnjCauKQBdzEIDOR5jEPya+sNg8nM4hWq
2B7bUNUmGTcLG6jPahw/Bq+Qlj1uHBInCvIeBIEzXjjGYTubP+Cd6fo3VQ71osCm
ELMjVsD/3xlcRehOdMX1LQqL4mWdGY3FpPccaqedRMHeR7z2MgWXT24506gMot9X
MKIUxhW/LsFrBuiBaiLO6LQghgc+SEMjazrFiwgSoT9LX6kPM4I=
=1UgX
-----END PGP SIGNATURE-----

--zOSQyqZkxRABoVqR--
