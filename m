Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9931A212B2F;
	Thu,  5 Feb 2026 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770303001; cv=none; b=kPu5HU/AhMKJe2FZGzS4K6HBQT7Sjm317C4uwuZZyozvxgYQRsJlRB3B8Bo3NlAoX1D8D9ptGo8hrLJKi4Kmm4EZfsM0VUMZFE3iR0coNNusAFiS6oJ6wInV63Hs9Zy/vUnbdyxznGLLin18xSe5v0MXgf8udPYEtQn1yoNr6Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770303001; c=relaxed/simple;
	bh=eCpfDrPC7Sij6DlPoVh5vnWpUxt6KXxG9MEWbBDVEfY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g9WF9pXDfnHPs7sivJVrmLyCRyH9soLugqbFmJINJCfT2xbgh4teHpALbKsKj6Nf3l81QjzkYdUnA9pyabteWC6TCEWlnty7/p8nd01AStSJhoSw2oe7dMVL7I63wSfJHi/7JerFWYafAsRCZebJStniGXtQQs2u/qrXajCP70w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gBZnEVDa; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gBZnEVDa"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4782540C7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770302994; bh=HgPMwmiqbSLM3vBpXYRFp06gHDGnDM4EGbc3pIT9hTs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gBZnEVDawX4dMgU/jWMj4hixSd5HLMi1tOzM3lNF9cLDM7grill+cl2lQ/4VJ0YpC
	 6zWyFI6RSQJfgur3LdDDcpqDxx0VT1iYWhjPweitJmaXkOR2ZrnddNW7WjgeaMSU7C
	 9jHUfbVLJ0k+4O8KiYN3pZqxEQtgnepvW6XUbKWI/3fSsUaZysKSi2qI6Fs+p/VDhI
	 RyC+9GvHMRCuENW4crw7oQ+Wycdinctyj4HGxy9SVoQKCuo+9FpAL88p9mpyrKebpS
	 GGYyqtsGht/b4EyJ6LsK2y3Uv6N39m8o6S2TObv8GsmAv+3Qpn3P+HHroTsLR0Av5g
	 FX2/rvFJ3ZSQw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4782540C7B;
	Thu,  5 Feb 2026 14:49:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Amitabh Srivastava <amitabh@amidevlab.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amitabh Srivastava <amitabh@amidevlab.com>
Subject: Re: [PATCH v3] docs: process: maintainer-pgp-guide: update
 kernel.org docs link
In-Reply-To: <20260205115554.7795-1-amitabh@amidevlab.com>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
Date: Thu, 05 Feb 2026 07:49:53 -0700
Message-ID: <875x8bi6su.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amitabh Srivastava <amitabh@amidevlab.com> writes:

> Update http link to the documentation about how to add a kernel.org UID to
> the maintainer's key. Add missing SPDX-License-Identifier to fix a
> checkpatch warning.
>
> Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>
> ---
>  Documentation/process/maintainer-pgp-guide.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentation/process/maintainer-pgp-guide.rst
> index b6919bf606c3..1e4d885dc784 100644
> --- a/Documentation/process/maintainer-pgp-guide.rst
> +++ b/Documentation/process/maintainer-pgp-guide.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +

Do you know that was the intended license for this file?  We need to be
careful about putting license declarations on other people's work.

Thanks,

jon
