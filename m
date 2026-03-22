Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D1927FD44;
	Sun, 22 Mar 2026 20:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774212798; cv=none; b=L0K9Dgm+JHX6w98bubYOOA8TnrUPT+DhiDBjRklLQCKUlUAn1Ve9KMWp1Lo2O/R6vyrEu2bTu2irN/cI8YuAczt0SU+OyEyPPVCOZkBBUYrpjH25OIX19iNmbphUs7xw7KS+dLFXDRoFiY7+oKJbAuIze5q6UVz41uQIy09Fvgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774212798; c=relaxed/simple;
	bh=K0TseoDJfj27TeW0hgJksRfZnKDKiZEvDxfbBoR3eoc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FoVrMDETzOUlkRllBrqh8NvKRONgBuT5/LAEOE5vRCx4NSf9ZDfO9/KaYlL7VntqE15owfNcUaeBtTZTggJTbl7a7QDym1sW+zksVmhlDm0ZVkf/luaec42g/mT3FK6ziQ95ZrazHpHEoOKZ4CpqZJ5uMww+/xhRzqr74uD+NMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=BCh0PH0I; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="BCh0PH0I"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7C584411E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774212796; bh=kVFwZCuR+IoKjLPlwhT5pETmVhvtzHuWlvUbqLlgWcE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BCh0PH0IHbUg8eX75GyRTzUezQxD/l+Ls7aEQLTgoZ1mYOyEQZH7jfZ1Fqx+Ut+nF
	 e33y36EksZ0s6Ykw0dOMhSRzne2dUpRbrHukkwVeLIfAbvEni+CwwADxaXFJ0nqY67
	 SDnVzKEkgHbv7WT+Y+iCbHDbOKdT99a/JFZCK0WzDvpuCJtt2/ZVMJZ3GVsBi5w7Pe
	 7MvynNEyemTOxzAdDm2pLihZft0N0w5H3ys2+p2M+PhaXEZrzziXHPH0hBo2RvsmoT
	 ZykpwF4PwZ5DZl6YrMxvy2bbcH1cs90azjaCq14IpC/nm9g9euA12NXQrZkxomzDVl
	 vJtq4uUVqy3aA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7C584411E2;
	Sun, 22 Mar 2026 20:53:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
 cocci@inria.fr, Nicolas Palix <nicolas.palix@imag.fr>, Hu Haowen
 <2023002089@link.tyut.edu.cn>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Federico Vaga
 <federico.vaga@vaga.pv.it>, Carlos Bilbao <carlos.bilbao@kernel.org>,
 Avadhut Naik <avadhut.naik@amd.com>, LIU Haoyang <tttturtleruss@gmail.com>
Subject: Re: [PATCH v2] coccinelle: update Coccinelle URL
In-Reply-To: <20260310121431.362091-1-Julia.Lawall@inria.fr>
References: <20260310121431.362091-1-Julia.Lawall@inria.fr>
Date: Sun, 22 Mar 2026 14:53:15 -0600
Message-ID: <87ikand1s4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Julia Lawall <Julia.Lawall@inria.fr> writes:

> The LIP6 URL no longer functions.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>
> v2: corrected the character encoding, no other changes
>
>  Documentation/dev-tools/coccinelle.rst                |    2 +-
>  Documentation/translations/it_IT/process/4.Coding.rst |    3 ++-
>  Documentation/translations/sp_SP/process/4.Coding.rst |    3 ++-
>  Documentation/translations/zh_CN/process/4.Coding.rst |    2 +-
>  Documentation/translations/zh_TW/process/4.Coding.rst |    2 +-
>  5 files changed, 7 insertions(+), 5 deletions(-)

Applied, thanks.

jon
