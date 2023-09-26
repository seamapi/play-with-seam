var r = new string(
    Enumerable
        .Repeat("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", 10)
        .Select(s => s[random.Next(s.Length)])
        .ToArray()
);

// Get a Seam Client
var seam = new Seam(
    basePath: string.Format("https://{0}.fakeseamconnect.seam.vc", r),
    apiToken: "seam_apikey1_token"
);