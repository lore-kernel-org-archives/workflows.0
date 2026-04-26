Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D9E219EB;
	Sun, 26 Apr 2026 00:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777162066; cv=none; b=hZds+GmIbGWMVcKH11Wgrsh2zQPhirbAKVAQf13yvisSOx3FS6hBK+Uvkg3NZswkU4zFfT/iFKRHZHBXFAE9KCVQFS1WdrX2tCEmraWbeavyaOW2Hoxu4hOzNcKH3wYr+lo8j418C7OiUm7HT1vH5On3/M31NhVxoeZ16ccN8bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777162066; c=relaxed/simple;
	bh=mGKGi0avynS6oeeg0+mfhIl+9C94RvPgJeNuyd0+bwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXMAoRpwCUUpgceYvDP0Lj3eBahT+zohSymv4/7Hqg/Kb8usYGoJNTAbuv5QW3rQeNfHKfgJ6JP8cHlhTuAGrmcmSi2z/uDo55nipdrmhXZPqllW/2ZRR2rNK1CfibPPN8q7BDunlbcPV/loSXdzw7OFRNyZ4cY8niZa35ic5XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4lCChAg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4lCChAg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA0BC2BCB0;
	Sun, 26 Apr 2026 00:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777162066;
	bh=mGKGi0avynS6oeeg0+mfhIl+9C94RvPgJeNuyd0+bwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4lCChAg2MzKFxuWXYfxz9OCUQCpc0ELDp3enRzwKlfa8DrxgzeN4vzGRCmi6v3pq
	 bx+U+FQSK/l85sssd+CPZUxCJZNAYfIlIsSytcvTP9Eb7/9mqbrBQZdlJfE4MMwroI
	 06ZAuBPJWvj4hIgS+6wPF+oC4P+dvBY1yZqzUp1//KTMwBZdhSieY8drcON7ieqnt/
	 ony9dDo+cCSDtzd48waRIHL3hsljsUywcJMiP6KoH6tGeRHEQUTABovm2RK4xiUqDg
	 iqRGfelvSkWM19yp6S9+vg01EbXdoxg0Lm3ifirJLU23h26gsMz/dipGRGsR16RP3V
	 2GyjQdoFk+IPw==
Date: Sat, 25 Apr 2026 20:07:44 -0400
From: Sasha Levin <sashal@kernel.org>
To: Joe Perches <joe@perches.com>
Cc: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, mricon@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, apw@canonical.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] checkpatch: add --json output mode
Message-ID: <ae1XUFURKgdG6lGh@laps>
References: <20260408172435.1268067-1-sashal@kernel.org>
 <20260425200431.4088895-1-sashal@kernel.org>
 <c8722587377c3bc4be03f7d04bd45912@perches.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c8722587377c3bc4be03f7d04bd45912@perches.com>

On Sat, Apr 25, 2026 at 02:52:35PM -0700, Joe Perches wrote:
>On 2026-04-25 13:04, Sasha Levin wrote:
>>Add a --json flag to checkpatch.pl that emits structured JSON output,
>>making results machine-parseable for CI systems, IDE integrations, and
>>AI-assisted code review tools.
>[]
>>A separate --json-pretty flag emits the same JSON in a pretty-printed
>>(indented, multi-line) form for human reading
>
>Why not just always use pretty?
>Would a script care?

Who's the intended consumer for the --json-pretty?

I my mind, --json is there to make it easier for tooling to process the output.

A user can already achieve the same result by piping the json output through jq
or other similar tools:

$ ./scripts/checkpatch.pl --json 0001-checkpatch-add-json-output-mode.patch 
{"filename":"0001-checkpatch-add-json-output-mode.patch","ignored_types":[],"issues":[],"total_checks":0,"total_errors":0,"total_lines":189,"total_warnings":0,"used_types":[]}
$ ./scripts/checkpatch.pl --json 0001-checkpatch-add-json-output-mode.patch | jq
{
   "filename": "0001-checkpatch-add-json-output-mode.patch",
   "ignored_types": [],
   "issues": [],
   "total_checks": 0,
   "total_errors": 0,
   "total_lines": 189,
   "total_warnings": 0,
   "used_types": []
}

-- 
Thanks,
Sasha
