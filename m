Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618A01C860B;
	Sat, 29 Nov 2025 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764430267; cv=none; b=VGph3R+lxPAgg3powDRWAjRc/d+zWHw3FmU1KeRQGPVehLN1qiLCxVVAOs6IaCzcraXzbAQtMkgh0XZN9ppS3lPUjKJN1aVX84BsTjlhtl0Y69qkM1oiLhfPK1e7xcCJqSoa8SMkYe+UtAHjbx9WHMOFchKryy7MfvRoCJhWMUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764430267; c=relaxed/simple;
	bh=+NhlOVI3u+C2SR14ds92UPn6IECPV6DLuMjYK4xu1Is=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YN/hSf29bHqguQYaFzOFE979A+2ALImE2i7z9iYxTM4WY6FGU6vOZxQyo2BHbRx1d2teXQj2RYWfjbDI7EpYS8YITG+lUijG4LbUNlhskPFL6SeVTRdi/4AikpOzYvvw0ibcF8TaxOu1pncv/h4ZCZNqtZ4bLJ1fa4CAHHr/tDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LcANbe9R; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LcANbe9R"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6CA81406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1764430265; bh=LwFr92VqBu4QHZ4t343hjS6PLscJ0UEs4gNANVhHGzs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LcANbe9RolGh8ZlUOVssoFOQTDsx+7pABCBhy8pMB9oFrzT5bOD8JEhyBxftRZvBY
	 Jgy2QDiFnI89pJ58BbvKsO8d19ix8cU/5YjX8JD+l7ayuqEM9xoDoe95w/Mhm6AmIx
	 +wVKMut1lGXe0f7tzdO2s2dmVqb/etxKtAK/jrMc1hGlYXHXgUCc523Ifrxk2b2Wjl
	 csg374wRZ4aNv/W1NpTxgyI+yU+pjG9SgExyPDtyjpcavkgvNvA5U+6c5bnbn3T3vz
	 lw5V+9nTDjbOcYyTfrIw07wgKqCl6Qkt1kkB0TVwZZhazhUWx+udglDtoCkimSbieb
	 BGD+RnKk/MHGg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6CA81406FB;
	Sat, 29 Nov 2025 15:31:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] docs: submitting-patches: Clarify that removal of Acks
 needs explanation too
In-Reply-To: <20251126081905.7684-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251126081905.7684-2-krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 08:31:04 -0700
Message-ID: <874iqcrh3b.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> The paragraph mentions only removal of Tested-by and Reviewed-by tags as
> action needing mentioning in patch changelog, so some developers treat
> it too literally.  Acks, as a weaker form of review/approval, should
> rarely be removed, but if that happens it should be explained as well.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/process/submitting-patches.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 910e8fc9e3c8..9a509f1a6873 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -592,8 +592,9 @@ Both Tested-by and Reviewed-by tags, once received on mailing list from tester
>  or reviewer, should be added by author to the applicable patches when sending
>  next versions.  However if the patch has changed substantially in following
>  version, these tags might not be applicable anymore and thus should be removed.
> -Usually removal of someone's Tested-by or Reviewed-by tags should be mentioned
> -in the patch changelog (after the '---' separator).
> +Usually removal of someone's Acked-by, Tested-by or Reviewed-by tags should be
> +mentioned in the patch changelog with an explanation (after the '---'
> +separator).

Applied, thanks.

jon
