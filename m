Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E173921DD;
	Wed, 24 Jun 2026 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296008; cv=none; b=BinUY01zrg3s94WNzxV2WRZl//GuWQx4CDJoPXYAJLcEWwKqUlLvetaavNvZg/6uEDaZphrU5vgPn+iYuKoV93Dd4jYC8Ls/UDv6dhXehrwrPravqbF25ulBKzy29YJdppC8xeKeYVYec1+C2Mu1aUx4WvT+utYbhgSVlRielX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296008; c=relaxed/simple;
	bh=uDGgmQDxNB5JYlaT2W9AeNfXuRBseXPEq1ddL/s6olI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmS6OrX5dNvmjj+19LOhXgvlutc35BbknYuAVzAgMMCyBqr4qFitJHJmXVbiD0z0FUTuXuwoiwwcRl99N1VrQUiLqMrEw2d/C0rYFluppiKF+hin4gY6TDAChofAKmXx4lPwSRE1zo3l+hLDaHZIqCUwlffBJ8yPBTfLc16PPFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Z3rd5C4c; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Z3rd5C4c"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1BCC263D;
	Wed, 24 Jun 2026 03:13:19 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACA203F62B;
	Wed, 24 Jun 2026 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782296004; bh=uDGgmQDxNB5JYlaT2W9AeNfXuRBseXPEq1ddL/s6olI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3rd5C4ccsWlusx04iTq9HGAvhuHiSLcLfmO5Bt2mHkpKF1D2QV8IgBUSUPxMUdNy
	 wFImr9R3SZPkZUe3+FTodWcm2mIUfbmY+0AHWx0cFbzgsisTTbsI7aeHbH/EsTwmy2
	 wMSachgYq0ul5YZJB7FD1hkHS3nTHbtoFVxLdEo8=
Date: Wed, 24 Jun 2026 11:13:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Harry Yoo <harry@kernel.org>, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, kaleshsingh@google.com,
	21cnbao@gmail.com, david@kernel.org, will@kernel.org
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Message-ID: <ajutu4JC6KRo46dv@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <ajVByfkLbetzA8bB@arm.com>
 <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org>
 <ajltLd6FQg1aMge_@arm.com>
 <78d97371-b477-4230-8690-ac870a7bab3b@arm.com>
 <ajq-Ukmd9NBruhr5@arm.com>
 <f5927785-d5d3-4e64-bbac-220d40718a1f@arm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5927785-d5d3-4e64-bbac-220d40718a1f@arm.com>

On Wed, Jun 24, 2026 at 09:44:49AM +0530, Dev Jain wrote:
> Anyhow someone needs to first test the current patchset to get some
> numbers, we would be wasting time on this if no one gets an improvement.

I agree. Something like iperf3 would be interesting, lots of skb
allocations.

-- 
Catalin
