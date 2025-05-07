Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704112874E7;
	Wed,  7 May 2025 15:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630421; cv=none; b=jzSclV1BJX6bEUL8DcxY8w5OyUxBTsd9pJbnku4d8JUET44QmTfW8EFulFwctM6+DLrBQIhfkhLUokAr4si7T+dOJ37iFcJ3mix9OU9assUrkOrE00SFZ4BLLYWjQWBen0NxMWyVUpfOEeCKnVzhooz60JCiVghd63yaiINiqcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630421; c=relaxed/simple;
	bh=9ZZ2X1Mi6G4gFWYgh4j686d6a5w6iHjtZ8hC17rBTzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQVp68nmRBcR5W42L/6kaITkGf0kN4NtzHpwSTq/+eIrsdP1/wfVvhswlOrhKwtQqT92Sx+NfJwAqlVgjG1pWXIBRrzKacx/FHZ1x2ByaIwechlG4dRfwZQjhXIzjlOFWddtOYBJMac9lcnfAFoHuRa9kkY4+eq7TyLZadNjiyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdLHoRYl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdLHoRYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C710C4CEE2;
	Wed,  7 May 2025 15:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746630420;
	bh=9ZZ2X1Mi6G4gFWYgh4j686d6a5w6iHjtZ8hC17rBTzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SdLHoRYlghBpr0RdkdaxwGml6tM9dyVDQUyOdtA8f88fWnG6q1jfWeXmRu+/mApgU
	 qlGDdJ1UdEGhSWcN/33Mu9sBc/znRQOjoH6Leh+w7+1NvigLu9PpkPcTnBz0OPBk8y
	 evWjz6y+34t3BfUwDBrPU34xXWlYeTpHNyDU0sVdhTFdC/aAAuCB1pGRSSqNOPQWDA
	 ehkG7Cc+iLdxcIONEswZKlFcnDNz4ei7PhGHG9bnRYZE476HAktzYFyhBslvkoutG6
	 TNfP4KA/Vf5lAOr9cDQl3hsS76r1Z/zKU8KE3NsXaSLz9sVjj9JQQ3lix7gC3RNwGx
	 g5X+SyMzRYB5g==
Date: Wed, 7 May 2025 11:06:55 -0400
From: Sasha Levin <sashal@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: stable@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [ANNOUNCE] AUTOSEL: Modern AI-powered Linux Kernel Stable
 Backport Classifier
Message-ID: <aBt3D3z0Ayn6R_YO@lappy>
References: <aBj_SEgFTXfrPVuj@lappy>
 <20250506072159.520ff0d5@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250506072159.520ff0d5@kernel.org>

On Tue, May 06, 2025 at 07:21:59AM -0700, Jakub Kicinski wrote:
>On Mon, 5 May 2025 14:11:20 -0400 Sasha Levin wrote:
>> - Detailed explanations of backporting decisions
>
>Are those available publicly or just to the person running the tool?
>I was scratching my hard quite a bit on the latest batch.

Yup, it presents it to the person running the tool. In theory you can
always go back and re-run whatever commit you'd like with the same query
and get a very similar explanation, so I didn't consider storing the
results.

>> - Extensive test coverage and validation
>
>Would be great to hear more. My very subjective feeling is that
>the last batch of AUTOSEL is much worse than the previous.
>Easily 50% of false positives.

"last batch" as in the big one I've sent out on Monday, or the small one
I sent on Tuesday?

-- 
Thanks,
Sasha
