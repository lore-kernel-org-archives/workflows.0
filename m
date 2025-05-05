Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427D026E15F;
	Mon,  5 May 2025 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746468685; cv=none; b=LyMtUlhrSYq7knldKOF5tbKxxZDKiivXyI1Y6H15sP8LxsTNyYpgqmhJUAfQ2ozXHwBM848UJZVxPzifkINA4lcUyz7nPBx6I0lsngUvIwFtpS6Z+mIii65MfIumQEgH9jobiL/qcIXrf637XcbUgILkJahP1P4jROOmvBIBDLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746468685; c=relaxed/simple;
	bh=W1ueBdjzvtcPTR7EMcZ9r0VXqmz0pOyWvCci9BiX3W8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ke5AiXI/kb+QuiuHHUYzvcyiOZ1Q3U4CRuEeL61Wv3MTH8OOep2WYuYbU3keqZDacL+Vls4kO1YEn2bzgr4awDfNZOQjTScO6POzXsxbUEmgyXZReynyRQXN2Wz3vXwwPHZJHmkNqCQpjVEONFM8sV4gk2VhOkDJfA2nwo5NACI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLv7B0b0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLv7B0b0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7908CC4CEE4;
	Mon,  5 May 2025 18:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746468684;
	bh=W1ueBdjzvtcPTR7EMcZ9r0VXqmz0pOyWvCci9BiX3W8=;
	h=Date:From:To:Subject:From;
	b=aLv7B0b0aIX7v9pWXJxSatLPQu2BavklkcYFrn1fZjUibMc2OodkB1C7oWkX+/MAp
	 LOIvBepZ7RjAgUIe2FuWtBG/W4xlv9y/fJ1vudQ5x/zGSyfo3WdoOymWn8euJg5HM8
	 nkI70a7ko+qib9vXzR+NuihYC1QhwTBPG2DEDGa9NqLd18V034pDve0mHQ5XRbiUyb
	 GB7sw7mVZPk2eBr0wqSVtKQKsI/kbhvvPOqbv/RJMWTb7uW2qb7gnT/vZYMR6cUdPp
	 88zGoqjOgq1muCxZNeJcZHX1gP3vD/uEU3Qn3+A8VjYkaa6Vl8ZrNoYDsAv3Rmvq7j
	 3K1HKokxGzeDA==
Date: Mon, 5 May 2025 14:11:20 -0400
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org, workflows@vger.kernel.org
Subject: [ANNOUNCE] AUTOSEL: Modern AI-powered Linux Kernel Stable Backport
 Classifier
Message-ID: <aBj_SEgFTXfrPVuj@lappy>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hello folks,

I'm pleased to announce the release of AUTOSEL, a complete rewrite of the
stable kernel patch selection tool that Julia Lawall and I presented back in
2018[1].  Unlike the previous version that relied on word statistics and older
neural network techniques, AUTOSEL leverages modern large language models and
embedding technology to provide significantly more accurate recommendations.

## What is AUTOSEL?

AUTOSEL automatically analyzes Linux kernel commits to determine whether they
should be backported to stable kernel trees. It examines commit messages, code
changes, and historical backporting patterns to make intelligent recommendations.

This is a complete rewrite of the original tool[1], with several major improvements:

1. Uses large language models (Claude, OpenAI, NVIDIA models) for semantic understanding
2. Implements embeddings-based similar commit retrieval for better context
3. Provides detailed explanations for each recommendation
4. Supports batch processing for efficient analysis of multiple commits

## Key Features

- Support for multiple LLM providers (Claude, OpenAI, NVIDIA)
- Self-contained embeddings using Candle
- Optional CUDA acceleration for faster analysis
- Detailed explanations of backporting decisions
- Extensive test coverage and validation

## Getting Started

```
git clone https://git.sr.ht/~sashal/autosel
cd autosel
cargo build --release
```

To analyze a specific commit:
```
./target/release/autosel --kernel-repo ~/linux --models claude --commit <SHA>
```

For more information, see the README.md file in the repository.

[1] https://lwn.net/Articles/764647/

-- 
Thanks,
Sasha
