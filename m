Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853173242B8;
	Mon, 11 May 2026 12:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778501564; cv=none; b=M4Q4A8J//LPS033eDJAYTFUtwqSi6Z3v2wQ6td8hzFuQve4Fm9nZbF4VWsyYbMlm/gitJVNNtTHjTJ5IN3TaOtRGsrcbY7QkhK2aCmoM+rPwVnHWC/5v5Em0blqWON1OI3DfXC+wA9X/nvnIvEYwnz+VJ9Wu6QU9PWKdabHzyYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778501564; c=relaxed/simple;
	bh=yiiSlm1k5WcFZ+Tupe9rszk6yFj+8Y2Pd8mz6aYqdTY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n7FjibSuqSK+uBtEy6ERsueZ4RGS7YBNHQ9cCKST1aF+XusH6aGNZx8jtTLjkLc4Lvv0NqoZ/Z7ntjNn8AkdSSH+dqXeWuNNh9tKyObwjmjk4IKhvdo/nN7FHcBOeEkFeXxLdJt+pSuns20L0+MGz7Qrr4I8TzKYBRJqWQLT/io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RhVjdrcZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RhVjdrcZ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 10D9C410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778501557; bh=VokAdgTG2y9lkz0FfnFTStioOu0fskx04WRkOrwfjH8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RhVjdrcZ0xwgo9eRdIOQhmXnRSAEdqyNVYQplV4TqUrkGkmkfZSbcrWiTzQriQuBB
	 5p1NpXuRPwP3qkFCGQ/NdqNf08kST1Lvupc8q5to0iLecioVyQKwvSVqglOEw6yQfB
	 kqvYfmc+2dpLfVOQd4Jcfyw6/BJierMo0VJxoiIclMmaOVEepcpQpASoiiLHdDkFh6
	 Rtd/VG7HjujKcp2Rv8/FrYrxiyEm4mQ4+fdRi3U3SgcNYIJgyvDuBMbmZXe7SmdMEZ
	 OC8hvO0l6aRUjRD7AE6rByeJwGfPhHOMCKrDkxa8L59bOAiIpmiTfl6YGN0Yx/27B+
	 5MhcY11Z6YqVg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 10D9C410B5;
	Mon, 11 May 2026 12:12:37 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, manuelebner@mailbox.org
Cc: andy.shevchenko@gmail.com, apw@canonical.com, dwaipayanray1@gmail.com,
 joe@perches.com, kees@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com,
 skhan@linuxfoundation.org, workflows@vger.kernel.org
Subject: Re: [PATCH 2/2] scripts: checkpatch.pl: add warning for strlcat()
In-Reply-To: <20260510165649.57880-2-manuelebner@mailbox.org>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
 <20260510165649.57880-2-manuelebner@mailbox.org>
Date: Mon, 11 May 2026 06:12:36 -0600
Message-ID: <87a4u6w3ez.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> add a warning for strlcat()
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  scripts/checkpatch.pl | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 0492d6afc9a1..ca1a8e67d529 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -7085,6 +7085,12 @@ sub process {
>  			     "Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89\n" . $herecurr);
>  		}
>  
> +# strlcat uses that should likely be
> +		if ($line =~ /\bstrlcat\s*\(/ && !is_userspace($realfile)) {
> +			WARN("STRLCAT",
> +			     "Prefer seq_buf_printf() over strlcat - see: https://github.com/KSPP/linux/issues/370\n" . $herecurr);
> +		}

Using seq_buf_printf() requires switching over to the seq_buf API in
general, it is not just a simple substitution, so this advice may prove
unhelpful to many.

jon
