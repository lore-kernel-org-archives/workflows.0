Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011332628D;
	Tue, 19 May 2026 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199871; cv=none; b=NwYwFP1xwm5RSi3x1yGYMNGdr6ElGtDl4bon2MEgVf/e7nJuHGvirifyoXWSPE9AMHuwf6fHEx0Mjc19pA93V6witl9Vlq3Id5CYbRYRo37KKsVO7bTG1J8kJ48IXkRXm6BLZB+1iO6PZQ0Xy3asyaXk3/yOpZN6R4Kr8wYC7I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199871; c=relaxed/simple;
	bh=htY8hqtawRFTSxusbcCFxZI713zUHbDkIkL9rQzvwrw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aZXz+2Ukh/pLVdX+AF+cTySZS1GgE3fKa9B03p80lxYjzZS2pTF+7p/Ec19zlvvR56JWY5YFsYoitiOBwedwg9/DvAfz3lPP/uJVFErKpUig1yX8wGhAhvADB5iWrQUA9F14qhEtse8Ajxk4gxkiIKz06ho1nV7l546MOKxA9hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bIfLl4Y6; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bIfLl4Y6"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gKc613DxHz9vh8;
	Tue, 19 May 2026 16:11:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779199865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htY8hqtawRFTSxusbcCFxZI713zUHbDkIkL9rQzvwrw=;
	b=bIfLl4Y6s7sv46dJFqUplq3KJ1JMTHAZ+wFitsDxgawARWCdclFCVXITfyFm5QmUjS+FLC
	fna30gosxS33pAMzQqLfHmF/xzTrrtYh99f2Jh/bqezKvPViObbMXf5VfRE9wn1rLTLKd+
	ZGvBXA2PzXMaTMFp/Hzdv9gUd6SL6Dx/QDBRruSDN572+GuhIOOV2+ggPW9McGsMxiR9e3
	ojR/Sq8tfTgZ06cw7thWHMRrKt4psqC4kHOAioh+elnkHqrU5ZhFWqsoKsZL/bfyT0xDZz
	YshVAHWf+EkrWrBrBFdGVYd3ebvZDJ4QAvI4SqCMSIE7JWKLYEIPScXdt0hFJw==
Message-ID: <584b2f5d131342952698ac5e5a567c79977cb1ba.camel@mailbox.org>
Subject: Re: [PATCH v2 0/3] Doc, scripts: facilitate phaseout of strlcat
From: Manuel Ebner <manuelebner@mailbox.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Kees Cook
 <kees@kernel.org>,  Jonathan Corbet	 <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Andy Whitcroft	 <apw@canonical.com>, Joe
 Perches <joe@perches.com>, Dwaipayan Ray	 <dwaipayanray1@gmail.com>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, David Laight <david.laight.linux@gmail.com>, Randy
 Dunlap	 <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, Heiko
 Carstens	 <hca@linux.ibm.com>, "open list:DOCUMENTATION PROCESS"	
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"	
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Date: Tue, 19 May 2026 16:10:48 +0200
In-Reply-To: <20260514160719.105084-3-manuelebner@mailbox.org>
References: <20260514160719.105084-3-manuelebner@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 7upx68fzgrp4upnkm77hz1t43zatgpnj
X-MBO-RS-ID: ad611a47d532e38a83d

Hello

i'll ditch this series - it's just not the time yet.

Manuel

On Thu, 2026-05-14 at 18:07 +0200, Manuel Ebner wrote:
> Thanks for all the feedback. I tried to incorporate it in this version.
>=20
> The goal of this series is to facilitate the transition away from strlcat=
()
>=20
> [v2]
> =C2=A0add recipants
> =C2=A0add remarks to strlcat definition in
> =C2=A0 lib/string.c
> =C2=A0 tools/include/nolibc/string.h
> =C2=A0 -> [3/3]
> =C2=A0
