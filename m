Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9E620AF8F;
	Mon, 13 Jan 2025 16:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736785230; cv=none; b=Z3iU/av37rEst2RXmRerEIRxksevwAdANyvfnYrTJKwmR2JKwT/hC2qIVPGeGPHvoiJv5OaGB97TE9Tgfg+n1VPrmpojmIdpmv13DRRYlo2BsSOKLs5STLED6go75MjTJlcaywaEZc3hggdq2znvIvRNYIJVKiORPLr4CQ13pBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736785230; c=relaxed/simple;
	bh=aWEXvWbAFMXdPyHcT62TuqcnKc4R3jvDIdeft1+tX78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNPT/RilOEp++rPIkMhLwMnEZm2Ifpvf4rIxol1dmRGr3DGBUPxssWvIGuSmtBv2xVifw9w603kuKde7W9Uu+FrvD/sRrcYneWCuy/Bi+FQEVp9VnMMf6JpvdBikcf50V6ygVjf5KSFVAX2QY2pUNiGsgpDRvrfkXFHVempM4Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WreXxWQ1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WreXxWQ1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+ziArb3etjqXwjmDZ/3YAYs4a3B6lNkvopEEJA24J14=; b=WreXxWQ16OzPVRBYf0vjsrceND
	KHpohG3bmUFKrtaQSlwcJDtsG3ZGOVR7IoERYRul5r+GHrv1Cm0v29WgfLWEH+fNd0sFzZpuQMqIT
	udYaKg+cviUDZWL0/3npx+DnydMKvqcZfhI9J2syuOPUrJm5C5dRwsfWbR5YaOhLuD1Z31ILg65zU
	ZKB30KbFWO0MCQKPOXfRUPECygqZdwoZi/cut9og7Io6VnQ1Perple64xFh+wDRBFTbeWEi4Ltnc7
	84+xbfXn+1HvPpbp34ZxtVrun4+xS10/sabdBhe0bxWOJpI0hvR8qFLoVBKXAK2R9sIWSNpNBm17K
	1ZbP9Pzw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNAt-000000014lC-0xFK;
	Mon, 13 Jan 2025 16:20:23 +0000
Date: Mon, 13 Jan 2025 16:20:23 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/2] checkpatch: Add support for Checkpatch-ignore patch
 footer
Message-ID: <Z4U9R2m0xVTRMlkk@casper.infradead.org>
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>

On Mon, Jan 13, 2025 at 04:04:21PM +0000, Brendan Jackman wrote:
> Checkpatch sometimes has false positives. This makes it less useful for
> automatic usage: tools like b4 [0] can run checkpatch on all of your
> patches and give you a quick overview. When iterating on a branch, it's
> tiresome to manually re-check that any errors are known false positives.
> 
> This patch adds a feature to record in the commit message that a patch
> might produce a certain checkpatch error, and that this is an expected
> false positive. Recording this information in the patch itself can also
> highlight it to reviewers, so they can make a judgment as to whether
> it's appropriate to ignore.

I think humans should always ignore checkpatch.  It's basically
worthless.
