Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACEA2D1931;
	Sun, 26 Apr 2026 19:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777232193; cv=none; b=fJvu5bgnjbcTRITbuDwyCa2A2ZfjDn/r/wVRIt7fwzP7krRRiKwMAKMZco7Irf2E7t/8GteXRqop1PnP+gOjAmA0LjoP82Bk7w+eAwZMvSjCKhdERi83ou0+zZxqyavm5KdlCZ78XgN65IZvxPLMRXkh6Dr4ELbu13e8Maq2Q/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777232193; c=relaxed/simple;
	bh=/27kobtX3hadghmim3rfezsoEKLoHOv/5NAG63nxnl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHc6zGU4s8SqxDTsfcZN18mz2hNwGUVQvAnhg7PwMfdqUWQ179DclJUnqJQsgonciyCCdz4qvrz5IAaFL/3tgCpgtAp+/zWNeG/+PCOtF+NAyfotUVktTkAXe1jQqFKWE6DO+aVNqpeAbgbU6W0vzm0vELUDQXWOFqYNkseVT5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=d5F0Q088; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="d5F0Q088"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=YdCsayYAkNl+ILalq4D+udi6kMR6fgJTij1+DFmbS5M=; b=d5F0Q088WAuWcGLW/tUfyMZglK
	s/jI+JWYu7ku1x/nMiUbOs07tfsEDLdV7g3PBdZC0Q6Qwx2tOtMOsJWfjEdbjoYTghR1tB/tzpha7
	xAY10QW8eMrqM757huy7LWtTKJxuyGA8qTSQtWEbP3VBqwcfwbCzrhU52dJeorkvrF23OKsqN9TH8
	MjyEsFWBkQmbbpc/rhmPlTBl5B/atjhwRjCXbTluwmm5Tier1VPPckyG+C6j9eYVRasks2MS7/ig5
	sBvxh+HH2v9u2ITZ9cyrNoqq//tQAIKL/0Lv8RV+aZKWc0usLpOBaFOQ2TAtby/dlONRv8ivbiaW2
	XXg85TZg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH5HJ-0000000FnKg-0NwF;
	Sun, 26 Apr 2026 19:36:29 +0000
Message-ID: <133e96b7-251d-4af2-8084-2adca3e547e4@infradead.org>
Date: Sun, 26 Apr 2026 12:36:28 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] Documentation: security-bugs: clarify requirements
 for AI-assisted reports
To: Willy Tarreau <w@1wt.eu>, greg@kroah.com
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 skhan@linuxfoundation.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-4-w@1wt.eu>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260426163914.19449-4-w@1wt.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/26/26 9:39 AM, Willy Tarreau wrote:
> +Use common sense when evaluating the report. If the affected file has not been
> +touched for more than one year and is maintained by a single individual, it is
> +likely that usage has declined and exposed users are virtually non-existent
> +(e.g., drivers for very old hardware, obsolte filesystems). In such cases,

                                         obsolete

> +there is no need to consume a maintainer's time with an unimportant report. If
> +the issue is clearly trivial and publicly discoverable, you should report it
> +directly to the public mailing lists.

-- 
~Randy

