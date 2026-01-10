Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C35221721;
	Sat, 10 Jan 2026 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768060363; cv=none; b=u5Hm6FufZFAcEK8yGfzOk0G4yu43Hk+N5ynyElt2xKj8o1fmLj6tb3LCEo1kfFAA0sWbp0sJVIY+avqDDeGzhK5uF1v2SByjJPChwP24ubpZXHSefuXit5ZlX9soMYox/tv2WbLb+M0mY9QmEaReamLd2iFoGiMqZyNGrB/87bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768060363; c=relaxed/simple;
	bh=YYKMOw90Y1U19OGXNvrvWbjsRsqZ+IiyhYmxJ9lvP6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRBEMmDNlD6oOhKlyLTnx0Z2QF0cU7UODHdXqxX4PBFdnBSkmuKYg7nu93O1iILHzT79dVg1I2PlXxdPj02n28vo9McJxJnr4FQA277s8nNAZB39Y7lvjukV1ao0kAj1k+4i0tZ1+5rOGNamk9nmIx0M32xfHlmy4a63QewRC5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DizAuHHn; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DizAuHHn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YYKMOw90Y1U19OGXNvrvWbjsRsqZ+IiyhYmxJ9lvP6g=; b=DizAuHHnQ9L+7BUFvQsiuFx40W
	6H7azZaWj4orPFBa1pvVc2xOsuzGkI+iKfCurv12JyDAa78HrQEQ/t5Sd64K5JNrGOJwfCFVOmXSC
	t5j4BxohrnJLSmBg2sH76UxDF9OScfsqucUaRl6+6eDoFLyaymFKfZXZSWlyL60TryDdtZ1KcUorU
	aK+/tH+fDajbkPNVfxt3tkSVawBjYSvX+H/D5mOJOd0PfnL7QifyaPf59KgErgm6inKCVI/+Sytgk
	6/md1d0BN+eamqNQDhTdKXziJ7i2sMdK3AtcJyASSRxUHfcuFYT8oITIhbjUFXvk6W3wHVRXsq1dD
	SWcUljTg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vebGL-00000000nTg-1004;
	Sat, 10 Jan 2026 15:52:25 +0000
Date: Sat, 10 Jan 2026 15:52:25 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Jens Axboe <axboe@kernel.dk>, Dave Hansen <dave.hansen@intel.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Dave Hansen <dave@sr71.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <aWJ1ufun16-5EEkb@casper.infradead.org>
References: <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
 <3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>
 <aWCSVh6NocePMvp8@stanley.mountain>
 <0b9a8f99-5cc4-40e8-a0e6-4887d1e1a796@lucifer.local>
 <aWJvcPeV5ziCt5Du@mail.hallyn.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWJvcPeV5ziCt5Du@mail.hallyn.com>

On Sat, Jan 10, 2026 at 09:25:36AM -0600, Serge E. Hallyn wrote:
> I just don't think the word "slop" should be used, because while it may
> be very clear to you, and may be clearly defined in some communities, me,
> I'm just guessing what you mean by it.

https://www.merriam-webster.com/wordplay/word-of-the-year

Picked up by AP and widely reported on by news organisations, eg:

https://www.cbc.ca/news/entertainment/slop-word-of-the-year-9.7015916
https://www.pbs.org/newshour/nation/merriam-websters-word-of-the-year-for-2025-is-ais-slop
https://arstechnica.com/ai/2025/12/merriam-webster-crowns-slop-word-of-the-year-as-ai-content-floods-internet/

It's widely known.
