Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9A231ED66;
	Mon, 19 Jan 2026 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768834185; cv=none; b=F23GQXzRpoljOj/PSTQNxfDjjoo5u42WptQqfLBzvOxIntPN3ksAGbdjFJq7k4iBA2xgqKwLbEYM2K4tM+ndYakkcjmwtRRwyCNFoNBkYryFYwf8itO/j1B2cHVTBljYD8MWPFgc4XS03sQak4jEICfc09QyG7MNONia3o7im6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768834185; c=relaxed/simple;
	bh=onEB+YonhnDpr/8VkEPZg6YzWhrHfPg9aQjesSepK/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1RBBKQcXQWbm5W5kQc/waemBI/q2vdwwGwisRJ3KZ7bscDesbEXKKyiIOHd1u8f+H4QnLN1JtfF1s3oYRta+Etq4PCNXBnKLIgaSD2GHKIyKTS55ts0IyLx/Xkb/zEL5Eua1H5OpNXB2aR3D7JAaH97zBJUtFpfAFtTx5kwoYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBbbwccL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBbbwccL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB52EC19423;
	Mon, 19 Jan 2026 14:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768834185;
	bh=onEB+YonhnDpr/8VkEPZg6YzWhrHfPg9aQjesSepK/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBbbwccLo99niENBeb7B7IN2ToIHugTIIuL+vlHTlsPYzCy5tSuU+O7/K+93IOME7
	 yTfl5ZUlBLOaR5G4u+WmGK6nSr98hXhS7LVrhtlK15l7C6q+ICl3ppYZX5hkSRmFHy
	 pwcCmwCZYfEega81rCp41Xnxd66MstMacugXDYUZ4AVtm/QXGzxOJ1rKe68QJYAUsJ
	 pdQKKjPyAUQpVRwoxSjC3f1RTFW16SovdaHLyfT168UzIuk1qJ1/L1ZEHiOF4tOq2C
	 gv9cjW38eO9a3uV7SNe9m1GN/Mj5ebK1UAhRMTgrdol6ob/ObZbIGrkskQwY9D1egm
	 0k6IGQn+FH8bw==
Date: Mon, 19 Jan 2026 14:49:40 +0000
From: Daniel Thompson <danielt@kernel.org>
To: junan <junan76@163.com>
Cc: jason.wessel@windriver.com, dianders@chromium.org, corbet@lwn.net,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] doc: kgdb: Add description about rodata=off kernel
 parameter
Message-ID: <aW5EhId-E6TzvR89@aspen.lan>
References: <20260116050410.772340-2-junan76@163.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116050410.772340-2-junan76@163.com>

On Fri, Jan 16, 2026 at 01:03:13PM +0800, junan wrote:
> STRICT_KERNEL_RWX can not be turned off throught menuconfig on some
> architectures, pass "rodata=off" to the kernel in this case.
>
> Tested with qemu on arm64.
>
> Signed-off-by: junan <junan76@163.com>
> Suggested-by: Will Deacon <will@kernel.org>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>

Jonathan: do you want to take this or should I take it via the kgdb
tree?


Daniel.
