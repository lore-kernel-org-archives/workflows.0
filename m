Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBD9375F67;
	Mon, 30 Mar 2026 16:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774888729; cv=none; b=WQMDJCQRNND4tyTNtDcMeQlS5JaTr0Kg1lHy+5lNLiZHJBd9nkv894U5haLttd1ih+utrfQTWPd40JX+V/6HK3fQ6oKyOiTSF2NBybtYwb+/1U7TH/xCQeYJ58SwO/ZXV8gcSJKFIAd/sbQXWdg3JSdQ/6Q18rY5fm7Djyf1jVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774888729; c=relaxed/simple;
	bh=eqf4wl5nJrzNSuy0eLwpisx96mByCY62+MYEJAfKnYA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pi6kuR1KE8Ntl2O0HIrVHQsU89maju+8PVQC62g4EEALglS5Cx1QGJ5PfwNiiI52ZRXuyxQAK2Cbq9yV19AAWjPQtr5m1cNu/7jvnifxEdTh4yp549PVw39hpgu5kjdt1aTqoZIePoJOUaOv2TIwGFhMneZ/bL81mXHkkCoimFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QFg4ZRE0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QFg4ZRE0"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DE8F44121F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774888728; bh=QAODc0DJ1dpKUOTyKqjdOqOkYk0TlP2tdUs2dsYSvU0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QFg4ZRE0c1b57o0Fwvoo0jMqCZ0qlRuYEp/KvdzsrYZ3PF5GJvJ+KggWd3NrFbAd+
	 MmgXYNFObv0FwLmH89rt+Wb8x5giEjlrcTRa6TtD+G8dxbfTDF6BHz7ho61G2g9Mut
	 w4L3kNPM+3DtaRYrgziLyNrv5Oy9lOwM6Bhfzt7X5yq8ax9rfNknh9IlAMhYdwnAh6
	 ZHpLnUSlpaD1ryJaQgmrgogePvtaV7f9TjhW3q6O1wthd55yWxed5CiCHLBBZ25fK7
	 t2OpQ/7Idd0e3xjLVi63/oNZnsUSIEFqxnse3yuGO8yq3fxnaeEMR0NjeYKDR33qyk
	 5RUPwc2N875BA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DE8F44121F;
	Mon, 30 Mar 2026 16:38:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Collin Funk
 <collin.funk1@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH v5 2/2] workflows, scripts: sort ver_linux and changes.rst
In-Reply-To: <20260325194811.78509-2-manuelebner@mailbox.org>
References: <20260325194326.77923-2-manuelebner@mailbox.org>
 <20260325194811.78509-2-manuelebner@mailbox.org>
Date: Mon, 30 Mar 2026 10:38:46 -0600
Message-ID: <877bqtnug9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> sort output of scripts/ver_linux alphabetically
> sort list in changes.rst alphabetically
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/process/changes.rst | 52 ++++++++++++-------------
>  scripts/ver_linux                 | 64 +++++++++++++++----------------
>  2 files changed, 58 insertions(+), 58 deletions(-)

Changelog is now:

docs: changes.rst and ver_linux: sort the lists

Sort the lists of tools in both scripts/ver_linux and
Documentation/process/changes.rst into alphabetical order, facilitating
comparison between the two.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
[jc: rewrote changelog]
Signed-off-by: Jonathan Corbet <corbet@lwn.net>

As an additional note...what would be Really Nice would be to have a
single list of tool dependencies that could be automatically used by
both files.  An additional bonus would be a mode in script/ver_linux to
only report on tools that are missing or below the required version.  A
guy can dream...:)

Thanks,

jon
