Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ABA29ACDD;
	Wed, 24 Jun 2026 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297617; cv=none; b=BMVjDHTfM3SzCEMdh2c5fZcU1vPorXGKnvkpPuYdINJkjR88cOWllnWpBEB4qQKXjsFfvBdAoyJNvV/k+3snqMN+JbLiAha01Uqd0pOUIIWlleDvN3IJ/qe3ET+voYwoEZXgk6atDo1kny0giDpEDkLFtC3KVweUhFP5fKK2FVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297617; c=relaxed/simple;
	bh=IzrxJ4YfTsSZNbE/QBIL1rZ/4phBH7xBojVl3zxKMJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pH4ZrMMXCMxneDWRe9U8F1Ii6dxq0hQ1hTGEolRROm9qwD3JhsAx16haMaLNXNKd+Q1cfLCDqXK+wmef/WejHamRedEKwZ8Xmd4Gda5Zc1TrAppqANYBUlnyfb4tWL0hXp28a5J2sgDiS/NONMvGr02lfNz33G87b8VSQ8yzxrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2r5Ztky; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2r5Ztky"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571B61F00A3D;
	Wed, 24 Jun 2026 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297615;
	bh=IzrxJ4YfTsSZNbE/QBIL1rZ/4phBH7xBojVl3zxKMJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I2r5ZtkyylAb0aCngjytNKMgs7UNdFQycrMiDt2yRHPWtpxIqUCNxHb/2WN7zpQFO
	 u9nBId26z9oKHbp34pV0RecOxQjDNiPCdgaOIPfP4JGK5hYF870BouKuMr+Wt7Y/Cr
	 AVNyDp3u4Ll4kpeP7Lu1SEUxeRyUgPZJjqL/Kwqw0FTI5eWsX7aETn23bRvnZWiqXR
	 73ubiRAtZfHgrDVJ3eQA59Jah/Sm3Hvc4s5gvTo9U9pe04r3qwz835Hvuz6+L8kqNN
	 I53+IbSSTl8g6ZXM5ZTRRXlEHJuYetd6lqaDgTtfFeCBlwiNqJh9gYyFt7uhnJhpK7
	 nMiCes9pdm+mA==
Date: Wed, 24 Jun 2026 11:40:10 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: kgdb-bugreport@lists.sourceforge.net, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	jason.wessel@windriver.com, dianders@chromium.org, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org
Subject: Re: [PATCH] docs: kgdb: Fix path of driver options
Message-ID: <aju0CgyXwsbBB9O7@aspen.lan>
References: <20260620234035.9917-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260620234035.9917-1-zenghui.yu@linux.dev>

On Sun, Jun 21, 2026 at 07:40:35AM +0800, Zenghui Yu wrote:
> The correct path of driver options should be
> /sys/module/<driver>/parameters/<option>. Fix it.
>
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>

Acked-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
