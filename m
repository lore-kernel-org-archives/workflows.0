Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F92017A31E;
	Tue,  5 May 2026 14:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990168; cv=none; b=D1sHqywPxK/DWmP3OG0AbK3FvdgsYU0em46a0+42yoW6+T62ceG370jX/a4cLICO+WE1RdgfhfrlEk+8exbPFcdrVFUUWSsm08Jw5sDFL9qk8XpfhbEuDK6GXVVk0pyi5Pw/TZgZeKK3kIyyQdTTSHg2qOYcsLQyxYf7uaIW9Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990168; c=relaxed/simple;
	bh=xwO1GDdaZRcHIWYRwKEI2P/EOUML7/r7OIocPeidE5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKlp2BdF/UOXygSGxTkKL6lHhkrxtNV4px8lIFtsPPZ9CXPuWqzhfsw5Llw5vudue6KxwAqSwaxOU54rHuEiwhF9qvb176EQGZ4H4vFLutZc2YA2emOWuMTPQsYiGeJ7EVa+/j83ILC3tVqAo0jKSN4yxj1qthm/m5j570XNzrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pIrCmne1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pIrCmne1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8D7C2BCB4;
	Tue,  5 May 2026 14:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777990168;
	bh=xwO1GDdaZRcHIWYRwKEI2P/EOUML7/r7OIocPeidE5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pIrCmne1Zy4Pmpq9RHOdeKVi7t3jrrxa6sGC7UKug7tGYUFtQtTXYjK+rGE8Eiwk2
	 SznJe4YDTTdrc1hNJnbS+qVX2GjVSQnc8Lqh5L6CvI4vLAy0ZRv2EVTblXvZdQMaqQ
	 6DyHCZclZaQXCBpyS/mYIFdGdBH4P2cBP+s0ZllFmoZSVJO66+nzkAMIBB+ciY8iG7
	 uPTR107iSsiKl0ZzavdlSmI2Aspuuzz26k8t3WpOL4BYZeAscmchYYWk7Kh871wNKM
	 9pSXtT5fukW8smXeNif4D8PwV8r26EuaiF0wqeMKsGjIJOJPFDkPTx2iPMLwe+TgAN
	 G/JkmAoEEVF4A==
Date: Tue, 5 May 2026 17:09:20 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: greg@kroah.com, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 3/3] Documentation: security-bugs: clarify
 requirements for AI-assisted reports
Message-ID: <20260505140920.GD11063@unreal>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-4-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503113506.5710-4-w@1wt.eu>

On Sun, May 03, 2026 at 01:35:06PM +0200, Willy Tarreau wrote:
> AI tools are increasingly used to assist in bug discovery. While these
> tools can identify valid issues, reports that are submitted without
> manual verification often lack context, contain speculative impact
> assessments, or include unnecessary formatting. Such reports increase
> triage effort, waste maintainers' time and may be ignored.
> 
> Reports where the reporter has verified the issue and the proposed fix
> typically meet quality standards. This documentation outlines specific
> requirements for length, formatting, and impact evaluation to reduce
> the effort needed to deal with these reports.
> 
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  Documentation/process/security-bugs.rst | 55 +++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 

Thanks,
Reviewed-by: Leon Romanovsky <leon@kernel.org>
