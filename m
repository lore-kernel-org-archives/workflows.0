Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E843FEB0A;
	Fri, 27 Mar 2026 17:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633852; cv=none; b=P3z5tPxzGnW9wCCdbHPKrStVZ3vloDjm9A32P7pOqh5OVYx6pl/N5vx4yrcM2UpbxrLLhln7of3Tvq6lWn6fHD0rXzCu8TZIyKSYAZHzBQulGa7Abl2ZmiGtl9cenG6oszzFy6cJ/DXNBekQXJRYCfLtDVsWndHTuFlD/TDQGIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633852; c=relaxed/simple;
	bh=H3RfsWcUrYoRiP74KmVwi9np1J49j2FEdsIbERIawYM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q2lDRjnBweWkJ3zRAb8D8LRWhrEy/edtFZmaF/6rYyAS7gxL+JUTekvVsC2jZhflezmT9Ag7ngApsQHMPEhb1NAgq8JXnNhYDMw66QJwrDlf26/fOysAT7usivJRzXExv5ANeF0wa8bvH1nL7SndtmG/Jlj1zWV4RsVr/KyWZSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=QFpY46HZ; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="QFpY46HZ"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 2A095C24D0;
	Fri, 27 Mar 2026 19:50:40 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 2A095C24D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1774633841;
	bh=H3RfsWcUrYoRiP74KmVwi9np1J49j2FEdsIbERIawYM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QFpY46HZwzMNmWn1FHg37wfuUfXdj2KjoinAqrexFNgpebV4+V2JQelElm4+bhLBw
	 ljhjl+KIRyAVdn5IyBu3uwaYcFp7E0FssVV+YGaIrjE4emkfcsN+JtuhbYydjx7LUj
	 FM2FDBjwoLXncDRv5GZXZi/2yaSX30rdc1QfG02VVLvDL1lm4Jpx49VdJTNQKFHmm9
	 VT2ob16+Am4DWB8FMEXm1/hFrHyh6gkg3a30Jv+aeW5O8LL4cmYcdjDXKvTtYbL3vj
	 5CajcFD8nR0OyprJ4yJMmvAyuqQOoDXabpSUn8kHtxTZadpSRk0K5iX8tqfjdq+0ZO
	 UT1+wdvxVdrjg==
Message-ID: <fd94d5148035d2672da568077ae4d5e7061e1162.camel@rendec.net>
Subject: Re: [PATCH] Documentation: Provide hints on how to debug Python GDB
 scripts
From: Radu Rendec <radu@rendec.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Cc: tglx@kernel.org, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	 <skhan@linuxfoundation.org>, Illia Ostapyshyn <illia@yshyn.com>, "open
 list:DOCUMENTATION PROCESS"
	 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"
	 <linux-doc@vger.kernel.org>
Date: Fri, 27 Mar 2026 13:50:38 -0400
In-Reply-To: <20260326233226.2248817-1-florian.fainelli@broadcom.com>
References: <20260326233226.2248817-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-03-26 at 16:32 -0700, Florian Fainelli wrote:
> By default GDB does not print a full stack of its integrated Python
> interpreter, thus making the debugging of GDB scripts more painful than
> it has to be.
>=20
> Suggested-by: Radu Rendec <radu@rendec.net>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
> =C2=A0Documentation/process/debugging/gdb-kernel-debugging.rst | 9 ++++++=
+++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/Documentation/process/debugging/gdb-kernel-debugging.rst b/D=
ocumentation/process/debugging/gdb-kernel-debugging.rst
> index 9475c759c722..53e225760a4d 100644
> --- a/Documentation/process/debugging/gdb-kernel-debugging.rst
> +++ b/Documentation/process/debugging/gdb-kernel-debugging.rst
> @@ -173,3 +173,12 @@ this is just a snapshot of the initial version::
> =C2=A0
> =C2=A0Detailed help can be obtained via "help <command-name>" for command=
s and "help
> =C2=A0function <function-name>" for convenience functions.
> +
> +Debugging GDB scripts
> +---------------------
> +
> +GDB does not enable a full Python backtrace which can make debugging GDB
> +scripts more difficult than necessary. The following will allow for prin=
ting a
> +full backtrace of the python environment::
> +
> + (gdb) set python print-stack full

Reviewed-by: Radu Rendec <radu@rendec.net>
