Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769CD1A8F84;
	Sat, 15 Aug 2026 22:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786833222; cv=none; b=if9hoV1CEMDvgC/fGxz/9eceyUIaobkszXgzICoIE3eMBKca8+gGpnaB+HXb/WmdRmy3chxK5oSroOIRhSAkdemseMUJNDIwiEWDfdzY8Hp3FBLIbzgZEweY6R6Kq+2hv8mp43dAuS9WJEfJ/StpaWBaNOlURq1h4WkE2yTkONY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786833222; c=relaxed/simple;
	bh=+Z9SoI/rJP95eDOu3Xo79Ue5UK2fbdubx970Ka43Xc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmKO+suXyFqwIQwOA+3wvTHgIl76J1hmxsJOYr3WaoQN9Sn/Fe4bxY5xWSnXPOaiK0W1AzPFyuhQHA2XwfLY9BRcgCX6QsgdvQ0oDyltOaUkfarxUe3fbybeZR5uJJc2L38Q7iDH0jAta86/HZ3NDqPfJazkx9/CO7X/5/HG9TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GetkFt3e; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GetkFt3e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+Z9SoI/rJP95eDOu3Xo79Ue5UK2fbdubx970Ka43Xc4=; b=GetkFt3esASdd6uTb2vA9ygEBU
	CF2XFg6+xoU5514dPeASxpgPGviTEh8pLH5zwj1/UZCkaR5H1ql5tbqBi329rt9EhOn5o2xCFkIL3
	YnTmeiyBHR95ePM/KLgueIFTMRMhwgNpzywFyDkTtwaX1NFIvUtsgEDWqAqhGY0iNqmZOjCpQSo3z
	4EvTNAFJi5acPp/eiuvRqccCaY886XGmJf3hH3HkEE+1c35YfXqQfaweyRtghNRjSoLg976DX4H5R
	N3AgMlKO0z3Uer3kkFK1R2S/gf5Gkvbndt7W2oipB2eX1FcMcxrJ15Plap8DjVXBZ1vxUE7caztqW
	+8AttsHw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMwQ-00000007LDg-0Gu4;
	Sat, 15 Aug 2026 22:33:26 +0000
Date: Sat, 15 Aug 2026 23:33:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Doc: process: Getting rid of OProfile url enlisting
Message-ID: <aoDpNWL1egKANzOW@casper.infradead.org>
References: <20260815220029.3711742-1-unixbhaskar@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815220029.3711742-1-unixbhaskar@gmail.com>

On Sun, Aug 16, 2026 at 03:23:17AM +0530, Bhaskar Chowdhury wrote:
> Aren't we done with this damn tool from a kernel perspective?? Thought,the link
> could be removed.

Maybe you'd like to use more polite wording in this commit message.
