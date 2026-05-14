Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648D82D238A;
	Thu, 14 May 2026 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778776325; cv=none; b=JvenGzcVPCdEPS99KDSEbM9PToDYFYRjqU/W9BNQZ4xagoftMdDKKBEoGhtJsd3Kt7E7KbYxe8j6TgUz3gqXmzUcPE9ENXpbrAlnyRBruq6oY67GGMlIvMI2lWRwQg3RD/6rQREneUJ/XD3KKwS1W2CTHJj2kmLiE4pDqGdabmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778776325; c=relaxed/simple;
	bh=nYUkAOmrp0e4MRpLSvuwJkEMx3dmElVxdQ7xMqZsuXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hxt3M74Jd84EAU3bTLxDX+iYJXUbCzlfq+kE96nCRvw7gj9T0oc19EDA2W9b+FYxNHjZ6mg4Btfitl4Nxg+YTZsZa0GOeczt1Yw7LeI4pnCAwlIlDe1s+r99i27gqqZPBkhB5PP+A/8jlZPMY6B7QMno/xVoGSI58mqYSbgfcHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NS3TqFKM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NS3TqFKM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B583C2BCB7;
	Thu, 14 May 2026 16:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778776325;
	bh=nYUkAOmrp0e4MRpLSvuwJkEMx3dmElVxdQ7xMqZsuXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NS3TqFKMBLphkUll97ZcS118XiY+5VzS5Q2X35n7Woo+cCVilqI3PsejXiCa7O9W3
	 x6NIsg/6NqJPHoGKZM2v0Q9FF2EnAivlY8jeLBU21mOzfU9cJRY75i+SPLrWA/jhoM
	 zlauJDn0E741NB8iQtXcGhmq03RdcoRqs0tZtkD4TibH/vo/Rr0gNV3YcVFcA2SnRE
	 1NKwjxqBXUD1fDgM97nFc0EiJrgh0NhHnOMMyjR+qupnX17XUAKG2cFQWKN0vQnmwn
	 xiCfZceskIs53R+VrPu5CBSB78HibVknK5dwNT87cv7pkGl5B1Vx5v9oazg9odhzR4
	 qVQd1p3chLK3g==
Date: Thu, 14 May 2026 09:32:04 -0700
From: Kees Cook <kees@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	David Laight <david.laight.linux@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] scripts: checkpatch.pl: add warning for strlcat()
Message-ID: <202605140932.624417BD3@keescook>
References: <20260514160719.105084-3-manuelebner@mailbox.org>
 <20260514162858.107919-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514162858.107919-2-manuelebner@mailbox.org>

On Thu, May 14, 2026 at 06:28:59PM +0200, Manuel Ebner wrote:
> add a warning for strlcat()
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
