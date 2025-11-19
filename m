Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767DD2DE6FF;
	Wed, 19 Nov 2025 22:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763591681; cv=none; b=qWbY/gMzbjx+FUmeMfHqeWYYtyNXcCuqH1Lfk6CV9dn57yJ2+4fgxOzszieIapcVRCGTywXjPDm9teR2dR/5VwDFucMj1oRayqsmtt2MO9TO4ETo3KAFWseORS5cFGn6/TMJ28bpkMoVBDYt7XmBf8YxG4xmEd8wgYFirE/Ag5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763591681; c=relaxed/simple;
	bh=65DZtkgL4wY699e+vvnuJV4J0GyOEKW8wNIUyJt210k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpbLBV9skjS9vRW2Ur6NTdAOglncuxcdNPuPSxgNF0HZWcQtE3khE7BfTciCRXEz0/thwp0mSqS1nvRfE7n9LD7NKWSFr8cev1xWSzvsydZ73jdNmd0jtrw871YhfQKlxKbTML7D/VZ+w1vQd9SVPy0zgENzTDyZFJSt3wVMFG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XeSo+tey; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XeSo+tey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB774C4CEF5;
	Wed, 19 Nov 2025 22:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763591680;
	bh=65DZtkgL4wY699e+vvnuJV4J0GyOEKW8wNIUyJt210k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XeSo+teyP0eCwedZBnBRUsbhf5eYianc90Phb4taVnk0lkYD7JfB0nZk3YiYjbKvi
	 Ci5lUp0A6UBqKbXh0QV3ifkBmlHpAhgldMKkzvoN0zV4yQEahJFznJD8PcyiAe39NJ
	 tRQQuUBt/tKBORmwCYEmPMveZgf+TwluaG9DSvqWZtWIm4mOQP7VAAMiKb/H0icxum
	 tO0YcCcPBun4iE72xXvd4CMx7bed39wV3UgedmcFiruw269IcG6DxHVf0diG5MNJJc
	 BBaC3zV3hWz0buD93VsE0lxMw50xn4/f8LGeanvgDCpDrz+3atluA276vM5waNE52M
	 NnrbZiFSC2n/Q==
Date: Wed, 19 Nov 2025 14:34:40 -0800
From: Kees Cook <kees@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, josh@joshtriplett.org,
	konstantin@linuxfoundation.org, linux-kernel@vger.kernel.org,
	rostedt@goodmis.org, workflows@vger.kernel.org, joe@perches.com,
	rdunlap@infradead.org
Subject: Re: [PATCH v4] README: restructure with role-based documentation and
 guidelines
Message-ID: <202511191434.9CA5301@keescook>
References: <20251119023832.1095490-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119023832.1095490-1-sashal@kernel.org>

On Tue, Nov 18, 2025 at 09:38:32PM -0500, Sasha Levin wrote:
> Reorganize README to provide targeted documentation paths for different user
> roles including developers, researchers, security experts, maintainers, and AI
> coding assistants. Add quick start section and essential docs links.
> 
> Include proper attribution requirements for AI-assisted contributions using
> Assisted-by tags with agent details and tools used.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> 
> Changes since v3:
> 
>  - No AI hype :)
>  - Link to a guide for building the kernel

Thanks! With the other comments in the v4 thread fixed:

Reviewed-by: Kees Cook <kees@kernel.org>

-Kees

-- 
Kees Cook
