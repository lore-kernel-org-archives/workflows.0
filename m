Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC1B73509
	for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 17:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709142766; cv=none; b=h5Wr1NfClPFWP25eoO+4Q/Y7OipUrkat3e0j800nWA4Oj/RSoQKBry9y7kXmB8X5zCiG817OFWe8CsBlNG5Zvxm78maPGsF2WMWXM50SwPLEfs+m+1al+LF/MptvdKVw0x0+HdfyYi+SMirFynuTm7aFIlpKr0k1QXKe7Fjj8Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709142766; c=relaxed/simple;
	bh=xFT5BiyncJ7kztkLT4b9m4QJ3D27hiRV/UFhggvJ41c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbCoiKjZERLXzxh+Bj7NG5JNYAvxjur8l0gXBfzjQl/i6oXfuc43MFeJx5avSzO0fQef8Fwf+oz0STaKlLjoFf24l5/addIFmADqhrCrCcD8hfTIZFdPYJm3SUzVHhPgA0fYJU9G/EYEb//xeapoYk5zMh7OmL9k0ou0loloLKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FzS8eKuF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FzS8eKuF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F25C433F1;
	Wed, 28 Feb 2024 17:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709142766;
	bh=xFT5BiyncJ7kztkLT4b9m4QJ3D27hiRV/UFhggvJ41c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzS8eKuFiCr4g1mHGl8RLM2e51o5TUk3heLigUKPrMgmVAuQpE5wv95pe50dzZN3m
	 ix/9o8swRETL7JHU1Oom+OiCOyXVYDDSIfDtpdHtoAfc8b+oQ2MX5jXy/ObquEHE/4
	 i7wDftM9Ku09cRGa+zOVfMajx7UYx/mFPUDWWU3U=
Date: Wed, 28 Feb 2024 12:52:43 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Mark Brown <broonie@kernel.org>, users@kernel.org, tools@kernel.org, 
	workflows@vger.kernel.org
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Message-ID: <20240228-urban-petrel-of-serenity-037e7d@lemur>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <20240228050007.GB18047@1wt.eu>
 <701aad76-2706-4e33-b8ba-9c76282e26d1@sirena.org.uk>
 <20240228-ethereal-swine-of-renovation-b1d7c7@meerkat>
 <Zd9RcdLAiEdB/7w2@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zd9RcdLAiEdB/7w2@1wt.eu>

On Wed, Feb 28, 2024 at 04:29:53PM +0100, Willy Tarreau wrote:
> > Another use for this that I could think is a way to summarize digests.
> > Currently, if you choose a digest subscription, you will receive a single
> > email with message subjects and all the new messages as individual
> > attachments. It would be interesting to see if we can send out a "here's
> > what's new" summary with links to threads instead.
> 
> Indeed!
> 
> > The challenge would be to do it in a way that doesn't bankrupt LFIT in the
> > process. :)
> 
> That's exactly why it would make sense to invest in one large machine
> and let it operate locally while "only" paying the power bill.

I'm not sure how realistic this is, if it takes 10 minutes to process a single
4000-word thread. :) With ChatGPT it would probably cost thousands of dollars
daily if we did this for large lists (and it doesn't really make sense to do
this on small lists anyway, as the whole purpose behind the idea is to
summarize lists with lots of traffic).

For the moment, I will document how I got this working and maybe look into
further shrinking the amount of data that would be needed to be sent to the
LLM. I will definitely need to make it easy to use a local model, since
relying on a proprietary service (of questionable repute in the eyes of many)
would not be in the true spirit of what we are all trying to do here. As I
said, I was mostly toying around with $25 worth credits that I had with
OpenAI.

-K
