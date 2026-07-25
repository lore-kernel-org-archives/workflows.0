Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AC226ED33;
	Sat, 25 Jul 2026 22:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785019667; cv=none; b=q8lcB/a/NllRWWxM6/A+G0Iy2ZUY9vFJVbZc3KZcAmSB8h2+Cg529O+TuHNksF1mz5XGtwLOhYTYxCVdvbPlQKzxOqagWhCGxCGX5xaFOY2JrLKmo1afxwGflvL25yAxT3hsVAseZD5EVg8XarEGPZ4ZAmCGiT8UKlC5OSluQe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785019667; c=relaxed/simple;
	bh=BwatChdjHNp+AOHw4ACx78Y+kzFBlShXeQmAAqFJkW8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qLJtuFm8c0EstT0yckl2yD+3mrYd+0ScjMwCoNJtqCcWTMscFfNMb4/UJKgAaar6CmMS1fCRuE+Yz7LgJygnbIjIHcwxdH5i+Mcty82SH6a9JsRUbs6imAxjHBPIKeCmboKqqSzqtw4kXggLHYFPyDFTjIQ4GnrJ1fJUI3iNvug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf03.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 6CB4EC03A2;
	Sat, 25 Jul 2026 22:47:38 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 5F2E76000D;
	Sat, 25 Jul 2026 22:47:35 +0000 (UTC)
Message-ID: <933506f1f210d3498d515d55266951e1914cbc9b.camel@perches.com>
Subject: Re: [PATCH] checkpatch: Validate committer sign-off
From: Joe Perches <joe@perches.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Dwaipayan Ray	
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andy Whitcroft	 <apw@canonical.com>
Cc: linux-arm-msm@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 25 Jul 2026 15:47:34 -0700
In-Reply-To: <20260724-checkpatch-committer-sob-v1-1-68550513106b@oss.qualcomm.com>
References: 
	<20260724-checkpatch-committer-sob-v1-1-68550513106b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 5F2E76000D
X-Stat-Signature: 74xs7hbw4q9pju5f4kfnim7mczscoupd
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+CLrt9/a3RHanLX9EjYXrSMZpzIud05pI=
X-HE-Tag: 1785019655-618187
X-HE-Meta: U2FsdGVkX1/26EYsA07Yz1AuaG0YbArJzECS23jhG+UvssyLFOXQV12nmv1JwrnrkeRG0lMlQ9invFUdGupMZlGhiMlZVbMp6iIsWFE7nu5rmBatkPs6PuMLH2704zagDjgZmBbMuqi0KlGBZkO1UdcBXadnIhONxf3NPoAeQrQGV0nBbBnAzcw6hMQ2v6i2AfUEmsTTGOsbHmvqiWRdj6vnkt/5fb3K0AVnYtXTcauKJoxpC5Idfv2WWoCC7lXQZLdRNzP+egtqb2AnwlsV1JeI71Nvb+BQhkZJ1BHa3sEQcCs6H2UarrkSydvIivci

On Fri, 2026-07-24 at 18:56 +0000, Bjorn Andersson wrote:
> ```
> checkpatch validates the Signed-off-by trailers against the patch's
> author, but misses the opportunity to also validate the committer when
> run with --git. Maintainers therefor need third-party scripts for the
> final Signed-off-by check.

I don't actually see that need as an issue for checkpatch.

checkpatch is for patches, not things that are already committed.

If something like this is added, it should _only_ be used when
--git is on the command line.
