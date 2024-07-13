Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476FA802;
	Sat, 13 Jul 2024 00:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720829573; cv=none; b=Qc994ivnpS5pwHqj17gpZ9LGgB2DOBfnly4L8S42F9WVO+0zkojl2gogkJcep+H0TkVo0nC7C3QJ1+2BrRMubZMGO6WE7ttorBNM7Fn76clHCWWJNXzyXeS6OWbj7V6maTRxVUejo8dN8Pp0PoOHfSxmDl7hDKV59qAWIfVn2Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720829573; c=relaxed/simple;
	bh=rLdXh0nmhzxcQj5pZff6ZjJBGpWhaOblrwrgaWUyc9U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NX0XpJ/el8QUPN9ROj3+mqtRRz8ix3VVK7WII0NGzBUGKue5dWPQlhxkzhZywDXAoRKeHKcNgEW6XFM7Rgr1yy3CXdU8PvaP1hTjQs7HhB14VNFpj7Y/hqh0AuODqezpvKmijl6gglQ1XUNxc4p1FkWJqGowQDPymfwLsVIkxaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qm2e5kRf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qm2e5kRf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF61C32782;
	Sat, 13 Jul 2024 00:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720829572;
	bh=rLdXh0nmhzxcQj5pZff6ZjJBGpWhaOblrwrgaWUyc9U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qm2e5kRfebHT7u9I9H/KnVYGLOMOJTKvfByj/rgjkujtWG6o2NRNwHiCsMrtlKDpR
	 hvyG92E4j0zZNcqSgYn77dT0BMAsgJCTRlqN2P1bCo84Iw9ES9+zS1WEO7xE7DwlEl
	 /HPo/9zbQT6yUvB4jMayIxHtF+9No5fGqAnMfrclBj6bH/KTirT2gHCl34wHxCDcEZ
	 zVeGyVDV5ktqxx7G5yB7rErle/4Otis5x0KmVpN9PsS8mgutlS6dl0JuaTxGrZLVWi
	 YqhfTkhW44osmXMHIH+hfTQydy/O3DZLfV5iy1hKq7y65ZJgGnIMvgX/NqlYqcRx0G
	 xcJoxJv1vw9Ng==
Date: Fri, 12 Jul 2024 17:12:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>,
 <corbet@lwn.net>, <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <20240712171251.297aca44@kernel.org>
In-Reply-To: <6691c3aca15f4_8e85329470@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240712144903.392284-1-kuba@kernel.org>
	<7570937c-ead6-40bc-b17f-4ade34a2acf6@sirena.org.uk>
	<1a30aea2-e8e4-487d-81e4-dda5c1e8665e@linuxfoundation.org>
	<20240712201156.1413e80e@foz.lan>
	<20240712164504.76b15e31@kernel.org>
	<6691c3aca15f4_8e85329470@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 12 Jul 2024 17:00:44 -0700 Dan Williams wrote:
> To be honest I am lost trying to understand who the audience is and what
> the actionable takeaway is from the guidance. It sounds like you are
> trying to educate drive-by submitters to push back against requests to
> take issues off the list. I think that's a reasonable education
> campaign, but doesn't that kind of "submitter bill-of-rights" note
> belong in Documentation/admin-guide/reporting-{issues,regressions}.rst
> as explicit "how to work your issue upstream" guidance?

Fair point. Not sure if reporting-* is a good place, I care about code
contributions 10x more than issues and other discussions. No strong
preference on the placement, as long as its documented...
